; DESCRIPTION: Renders a green line between points (335, 5) and (347, 79).
; PLAN: r0=335(x1), r1=5(y1), r2=347(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 5
LDI r2, 347
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
