; DESCRIPTION: Renders a black line between points (286, 115) and (195, 205).
; PLAN: r0=286(x1), r1=115(y1), r2=195(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 115
LDI r2, 195
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
