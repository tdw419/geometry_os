; DESCRIPTION: Renders a purple line between points (334, 216) and (328, 111).
; PLAN: r0=334(x1), r1=216(y1), r2=328(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 216
LDI r2, 328
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
