; DESCRIPTION: Renders a black line between points (401, 123) and (227, 150).
; PLAN: r0=401(x1), r1=123(y1), r2=227(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 123
LDI r2, 227
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
