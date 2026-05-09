; DESCRIPTION: Renders a blue line between points (269, 84) and (499, 130).
; PLAN: r0=269(x1), r1=84(y1), r2=499(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 84
LDI r2, 499
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
