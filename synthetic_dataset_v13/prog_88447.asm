; DESCRIPTION: Places a orange line segment connecting (400, 221) to (220, 85).
; PLAN: r0=400(x1), r1=221(y1), r2=220(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 221
LDI r2, 220
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
