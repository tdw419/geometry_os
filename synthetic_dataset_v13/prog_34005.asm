; DESCRIPTION: Places a green line segment connecting (500, 178) to (9, 212).
; PLAN: r0=500(x1), r1=178(y1), r2=9(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 178
LDI r2, 9
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
