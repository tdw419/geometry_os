; DESCRIPTION: Draws a yellow line from (121, 128) to (126, 53).
; PLAN: r0=121(x1), r1=128(y1), r2=126(x2), r3=53(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 128
LDI r2, 126
LDI r3, 53
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
