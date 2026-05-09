; DESCRIPTION: Renders a purple line between points (374, 149) and (170, 44).
; PLAN: r0=374(x1), r1=149(y1), r2=170(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 149
LDI r2, 170
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
