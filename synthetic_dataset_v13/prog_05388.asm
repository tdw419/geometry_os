; DESCRIPTION: Renders a yellow line between points (83, 6) and (140, 9).
; PLAN: r0=83(x1), r1=6(y1), r2=140(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 6
LDI r2, 140
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
