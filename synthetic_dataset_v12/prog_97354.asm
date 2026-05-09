; DESCRIPTION: Renders a red line between points (45, 14) and (83, 237).
; PLAN: r0=45(x1), r1=14(y1), r2=83(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 14
LDI r2, 83
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
