; DESCRIPTION: Renders a yellow line between points (83, 75) and (380, 137).
; PLAN: r0=83(x1), r1=75(y1), r2=380(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 75
LDI r2, 380
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
