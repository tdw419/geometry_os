; DESCRIPTION: Renders a purple line between points (83, 79) and (143, 70).
; PLAN: r0=83(x1), r1=79(y1), r2=143(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 79
LDI r2, 143
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
