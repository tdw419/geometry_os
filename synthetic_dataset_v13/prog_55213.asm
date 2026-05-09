; DESCRIPTION: Places a orange line segment connecting (249, 106) to (200, 215).
; PLAN: r0=249(x1), r1=106(y1), r2=200(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 106
LDI r2, 200
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
