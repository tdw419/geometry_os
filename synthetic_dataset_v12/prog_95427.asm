; DESCRIPTION: Places a orange line segment connecting (332, 214) to (126, 200).
; PLAN: r0=332(x1), r1=214(y1), r2=126(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 214
LDI r2, 126
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
