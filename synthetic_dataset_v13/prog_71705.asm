; DESCRIPTION: Renders a orange line between points (268, 52) and (223, 214).
; PLAN: r0=268(x1), r1=52(y1), r2=223(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 52
LDI r2, 223
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
