; DESCRIPTION: Renders a black line between points (139, 45) and (189, 56).
; PLAN: r0=139(x1), r1=45(y1), r2=189(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 45
LDI r2, 189
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
