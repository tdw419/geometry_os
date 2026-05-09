; DESCRIPTION: Places a yellow line segment connecting (402, 32) to (485, 89).
; PLAN: r0=402(x1), r1=32(y1), r2=485(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 32
LDI r2, 485
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
