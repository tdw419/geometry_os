; DESCRIPTION: Renders a orange line between points (49, 250) and (464, 84).
; PLAN: r0=49(x1), r1=250(y1), r2=464(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 250
LDI r2, 464
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
