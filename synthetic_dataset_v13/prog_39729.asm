; DESCRIPTION: Places a orange line segment connecting (220, 17) to (233, 207).
; PLAN: r0=220(x1), r1=17(y1), r2=233(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 17
LDI r2, 233
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
