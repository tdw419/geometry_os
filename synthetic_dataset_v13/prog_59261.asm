; DESCRIPTION: Renders a orange line between points (421, 248) and (491, 204).
; PLAN: r0=421(x1), r1=248(y1), r2=491(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 248
LDI r2, 491
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
