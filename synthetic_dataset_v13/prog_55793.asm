; DESCRIPTION: Draws a yellow line from (475, 65) to (53, 128).
; PLAN: r0=475(x1), r1=65(y1), r2=53(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 65
LDI r2, 53
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
