; DESCRIPTION: Renders a black line between points (310, 156) and (251, 212).
; PLAN: r0=310(x1), r1=156(y1), r2=251(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 156
LDI r2, 251
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
