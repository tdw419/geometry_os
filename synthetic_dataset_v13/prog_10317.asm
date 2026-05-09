; DESCRIPTION: Draws a blue line from (37, 224) to (22, 75).
; PLAN: r0=37(x1), r1=224(y1), r2=22(x2), r3=75(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 224
LDI r2, 22
LDI r3, 75
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
