; DESCRIPTION: Draws a blue line from (144, 224) to (9, 5).
; PLAN: r0=144(x1), r1=224(y1), r2=9(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 224
LDI r2, 9
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
