; DESCRIPTION: Draws a yellow line from (19, 72) to (121, 42).
; PLAN: r0=19(x1), r1=72(y1), r2=121(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 72
LDI r2, 121
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
