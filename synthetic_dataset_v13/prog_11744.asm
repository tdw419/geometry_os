; DESCRIPTION: Renders a purple line between points (218, 222) and (286, 205).
; PLAN: r0=218(x1), r1=222(y1), r2=286(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 222
LDI r2, 286
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
