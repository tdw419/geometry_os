; DESCRIPTION: Renders a black line between points (83, 185) and (305, 30).
; PLAN: r0=83(x1), r1=185(y1), r2=305(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 185
LDI r2, 305
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
