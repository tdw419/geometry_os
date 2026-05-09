; DESCRIPTION: Renders a orange line between points (401, 88) and (57, 129).
; PLAN: r0=401(x1), r1=88(y1), r2=57(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 88
LDI r2, 57
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
