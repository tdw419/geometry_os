; DESCRIPTION: Renders a orange line between points (440, 233) and (54, 83).
; PLAN: r0=440(x1), r1=233(y1), r2=54(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 233
LDI r2, 54
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
