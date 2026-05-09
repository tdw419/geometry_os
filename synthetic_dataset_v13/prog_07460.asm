; DESCRIPTION: Renders a orange line between points (72, 248) and (135, 200).
; PLAN: r0=72(x1), r1=248(y1), r2=135(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 248
LDI r2, 135
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
