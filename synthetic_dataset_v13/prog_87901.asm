; DESCRIPTION: Renders a blue line between points (444, 176) and (489, 224).
; PLAN: r0=444(x1), r1=176(y1), r2=489(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 176
LDI r2, 489
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
