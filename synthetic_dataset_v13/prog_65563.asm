; DESCRIPTION: Renders a purple line between points (433, 218) and (417, 93).
; PLAN: r0=433(x1), r1=218(y1), r2=417(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 218
LDI r2, 417
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
