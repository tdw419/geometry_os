; DESCRIPTION: Renders a white line between points (91, 45) and (467, 11).
; PLAN: r0=91(x1), r1=45(y1), r2=467(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 45
LDI r2, 467
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
