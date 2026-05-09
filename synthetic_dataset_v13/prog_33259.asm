; DESCRIPTION: Renders a orange line between points (326, 55) and (372, 255).
; PLAN: r0=326(x1), r1=55(y1), r2=372(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 55
LDI r2, 372
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
