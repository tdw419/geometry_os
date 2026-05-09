; DESCRIPTION: Renders a orange line between points (289, 204) and (459, 168).
; PLAN: r0=289(x1), r1=204(y1), r2=459(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 204
LDI r2, 459
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
