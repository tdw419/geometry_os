; DESCRIPTION: Renders a purple line between points (269, 54) and (91, 225).
; PLAN: r0=269(x1), r1=54(y1), r2=91(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 54
LDI r2, 91
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
