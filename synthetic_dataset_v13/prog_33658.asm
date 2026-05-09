; DESCRIPTION: Renders a orange line between points (360, 248) and (248, 244).
; PLAN: r0=360(x1), r1=248(y1), r2=248(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 248
LDI r2, 248
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
