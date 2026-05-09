; DESCRIPTION: Renders a orange line between points (437, 188) and (251, 211).
; PLAN: r0=437(x1), r1=188(y1), r2=251(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 188
LDI r2, 251
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
