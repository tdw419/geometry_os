; DESCRIPTION: Renders a orange line between points (495, 134) and (240, 79).
; PLAN: r0=495(x1), r1=134(y1), r2=240(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 134
LDI r2, 240
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
