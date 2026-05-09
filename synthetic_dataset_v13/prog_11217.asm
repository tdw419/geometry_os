; DESCRIPTION: Draws a orange line from (124, 0) to (439, 136).
; PLAN: r0=124(x1), r1=0(y1), r2=439(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 0
LDI r2, 439
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
