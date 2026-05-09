; DESCRIPTION: Renders a black line between points (248, 189) and (405, 145).
; PLAN: r0=248(x1), r1=189(y1), r2=405(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 189
LDI r2, 405
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
