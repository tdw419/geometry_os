; DESCRIPTION: Renders a magenta line between points (234, 110) and (318, 227).
; PLAN: r0=234(x1), r1=110(y1), r2=318(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 110
LDI r2, 318
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
