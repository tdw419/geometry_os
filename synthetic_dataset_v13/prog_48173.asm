; DESCRIPTION: Renders a orange line between points (251, 90) and (249, 92).
; PLAN: r0=251(x1), r1=90(y1), r2=249(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 90
LDI r2, 249
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
