; DESCRIPTION: Renders a orange line between points (75, 87) and (137, 236).
; PLAN: r0=75(x1), r1=87(y1), r2=137(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 87
LDI r2, 137
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
