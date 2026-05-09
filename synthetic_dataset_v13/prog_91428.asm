; DESCRIPTION: Renders a purple line between points (240, 65) and (278, 244).
; PLAN: r0=240(x1), r1=65(y1), r2=278(x2), r3=244(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 65
LDI r2, 278
LDI r3, 244
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
