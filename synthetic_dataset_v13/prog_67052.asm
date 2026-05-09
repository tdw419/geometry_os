; DESCRIPTION: Renders a white line between points (490, 234) and (318, 160).
; PLAN: r0=490(x1), r1=234(y1), r2=318(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 234
LDI r2, 318
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
