; DESCRIPTION: Renders a orange line between points (164, 232) and (461, 204).
; PLAN: r0=164(x1), r1=232(y1), r2=461(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 232
LDI r2, 461
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
