; DESCRIPTION: Renders a orange line between points (155, 215) and (140, 222).
; PLAN: r0=155(x1), r1=215(y1), r2=140(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 215
LDI r2, 140
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
