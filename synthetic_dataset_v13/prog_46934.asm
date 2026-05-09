; DESCRIPTION: Renders a black line between points (273, 175) and (376, 203).
; PLAN: r0=273(x1), r1=175(y1), r2=376(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 175
LDI r2, 376
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
