; DESCRIPTION: Renders a orange line between points (201, 255) and (378, 243).
; PLAN: r0=201(x1), r1=255(y1), r2=378(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 255
LDI r2, 378
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
