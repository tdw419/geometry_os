; DESCRIPTION: Renders a orange line between points (335, 137) and (305, 126).
; PLAN: r0=335(x1), r1=137(y1), r2=305(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 137
LDI r2, 305
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
