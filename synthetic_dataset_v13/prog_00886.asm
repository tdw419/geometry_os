; DESCRIPTION: Draws a orange line from (2, 253) to (52, 21).
; PLAN: r0=2(x1), r1=253(y1), r2=52(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 253
LDI r2, 52
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
