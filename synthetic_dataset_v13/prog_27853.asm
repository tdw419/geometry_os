; DESCRIPTION: Places a black line segment connecting (311, 96) to (500, 63).
; PLAN: r0=311(x1), r1=96(y1), r2=500(x2), r3=63(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 96
LDI r2, 500
LDI r3, 63
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
