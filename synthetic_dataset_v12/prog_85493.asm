; DESCRIPTION: Renders a cyan line between points (287, 185) and (83, 124).
; PLAN: r0=287(x1), r1=185(y1), r2=83(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 185
LDI r2, 83
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
