; DESCRIPTION: Renders a orange line between points (440, 172) and (109, 234).
; PLAN: r0=440(x1), r1=172(y1), r2=109(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 172
LDI r2, 109
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
