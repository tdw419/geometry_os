; DESCRIPTION: Renders a white line between points (85, 183) and (83, 166).
; PLAN: r0=85(x1), r1=183(y1), r2=83(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 183
LDI r2, 83
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
