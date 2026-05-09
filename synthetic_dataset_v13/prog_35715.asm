; DESCRIPTION: Draws a orange line from (420, 2) to (402, 169).
; PLAN: r0=420(x1), r1=2(y1), r2=402(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 2
LDI r2, 402
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
