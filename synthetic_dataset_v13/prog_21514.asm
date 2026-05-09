; DESCRIPTION: Draws a green line from (37, 21) to (472, 175).
; PLAN: r0=37(x1), r1=21(y1), r2=472(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 21
LDI r2, 472
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
