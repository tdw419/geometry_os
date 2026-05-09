; DESCRIPTION: Renders a red line between points (176, 234) and (119, 63).
; PLAN: r0=176(x1), r1=234(y1), r2=119(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 234
LDI r2, 119
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
