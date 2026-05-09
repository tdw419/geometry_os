; DESCRIPTION: Renders a yellow line between points (427, 222) and (365, 78).
; PLAN: r0=427(x1), r1=222(y1), r2=365(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 222
LDI r2, 365
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
