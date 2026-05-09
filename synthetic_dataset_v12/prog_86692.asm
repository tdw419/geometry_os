; DESCRIPTION: Places a yellow line segment connecting (288, 164) to (440, 205).
; PLAN: r0=288(x1), r1=164(y1), r2=440(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 164
LDI r2, 440
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
