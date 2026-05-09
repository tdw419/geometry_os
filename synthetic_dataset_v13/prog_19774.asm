; DESCRIPTION: Renders a orange line between points (308, 80) and (454, 5).
; PLAN: r0=308(x1), r1=80(y1), r2=454(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 80
LDI r2, 454
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
