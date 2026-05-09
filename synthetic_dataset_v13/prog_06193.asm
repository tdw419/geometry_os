; DESCRIPTION: Renders a white line between points (87, 79) and (417, 105).
; PLAN: r0=87(x1), r1=79(y1), r2=417(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 79
LDI r2, 417
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
