; DESCRIPTION: Renders a orange line between points (503, 91) and (464, 20).
; PLAN: r0=503(x1), r1=91(y1), r2=464(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 91
LDI r2, 464
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
