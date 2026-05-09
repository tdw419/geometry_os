; DESCRIPTION: Places a green line segment connecting (215, 20) to (219, 22).
; PLAN: r0=215(x1), r1=20(y1), r2=219(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 20
LDI r2, 219
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
