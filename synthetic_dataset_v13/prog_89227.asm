; DESCRIPTION: Renders a black line between points (429, 30) and (291, 123).
; PLAN: r0=429(x1), r1=30(y1), r2=291(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 30
LDI r2, 291
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
