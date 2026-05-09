; DESCRIPTION: Renders a black line between points (429, 174) and (414, 78).
; PLAN: r0=429(x1), r1=174(y1), r2=414(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 174
LDI r2, 414
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
