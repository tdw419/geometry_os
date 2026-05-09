; DESCRIPTION: Renders a white line between points (185, 79) and (347, 75).
; PLAN: r0=185(x1), r1=79(y1), r2=347(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 79
LDI r2, 347
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
