; DESCRIPTION: Places a orange line segment connecting (464, 11) to (192, 167).
; PLAN: r0=464(x1), r1=11(y1), r2=192(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 11
LDI r2, 192
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
