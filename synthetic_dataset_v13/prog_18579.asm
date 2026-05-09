; DESCRIPTION: Renders a white line between points (83, 45) and (51, 62).
; PLAN: r0=83(x1), r1=45(y1), r2=51(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 45
LDI r2, 51
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
