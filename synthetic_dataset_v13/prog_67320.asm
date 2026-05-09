; DESCRIPTION: Renders a orange line between points (135, 152) and (312, 10).
; PLAN: r0=135(x1), r1=152(y1), r2=312(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 152
LDI r2, 312
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
