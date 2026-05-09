; DESCRIPTION: Renders a yellow line between points (203, 234) and (300, 245).
; PLAN: r0=203(x1), r1=234(y1), r2=300(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 234
LDI r2, 300
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
