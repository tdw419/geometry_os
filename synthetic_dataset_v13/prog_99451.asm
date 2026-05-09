; DESCRIPTION: Renders a purple line between points (178, 255) and (78, 93).
; PLAN: r0=178(x1), r1=255(y1), r2=78(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 255
LDI r2, 78
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
