; DESCRIPTION: Renders a orange line between points (495, 23) and (349, 150).
; PLAN: r0=495(x1), r1=23(y1), r2=349(x2), r3=150(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 23
LDI r2, 349
LDI r3, 150
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
