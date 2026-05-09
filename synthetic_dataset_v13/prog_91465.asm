; DESCRIPTION: Renders a orange line between points (229, 120) and (70, 244).
; PLAN: r0=229(x1), r1=120(y1), r2=70(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 120
LDI r2, 70
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
