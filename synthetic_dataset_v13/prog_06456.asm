; DESCRIPTION: Places a orange line segment connecting (186, 180) to (200, 17).
; PLAN: r0=186(x1), r1=180(y1), r2=200(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 180
LDI r2, 200
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
