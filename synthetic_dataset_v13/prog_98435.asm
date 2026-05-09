; DESCRIPTION: Renders a green line between points (251, 17) and (427, 28).
; PLAN: r0=251(x1), r1=17(y1), r2=427(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 17
LDI r2, 427
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
