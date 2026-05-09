; DESCRIPTION: Renders a blue line between points (416, 83) and (506, 56).
; PLAN: r0=416(x1), r1=83(y1), r2=506(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 83
LDI r2, 506
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
