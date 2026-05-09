; DESCRIPTION: Renders a white line between points (45, 105) and (427, 50).
; PLAN: r0=45(x1), r1=105(y1), r2=427(x2), r3=50(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 105
LDI r2, 427
LDI r3, 50
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
