; DESCRIPTION: Places a orange line segment connecting (257, 130) to (72, 200).
; PLAN: r0=257(x1), r1=130(y1), r2=72(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 130
LDI r2, 72
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
