; DESCRIPTION: Places a yellow line segment connecting (350, 78) to (45, 249).
; PLAN: r0=350(x1), r1=78(y1), r2=45(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 78
LDI r2, 45
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
