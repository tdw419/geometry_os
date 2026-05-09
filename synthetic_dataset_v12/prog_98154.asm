; DESCRIPTION: Renders a purple line between points (455, 240) and (283, 55).
; PLAN: r0=455(x1), r1=240(y1), r2=283(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 240
LDI r2, 283
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
