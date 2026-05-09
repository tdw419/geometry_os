; DESCRIPTION: Draws a orange line from (399, 253) to (214, 216).
; PLAN: r0=399(x1), r1=253(y1), r2=214(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 253
LDI r2, 214
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
