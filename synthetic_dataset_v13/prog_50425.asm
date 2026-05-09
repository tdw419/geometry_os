; DESCRIPTION: Renders a orange line between points (336, 121) and (495, 21).
; PLAN: r0=336(x1), r1=121(y1), r2=495(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 121
LDI r2, 495
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
