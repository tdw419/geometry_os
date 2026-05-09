; DESCRIPTION: Renders a orange line between points (400, 3) and (365, 1).
; PLAN: r0=400(x1), r1=3(y1), r2=365(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 3
LDI r2, 365
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
