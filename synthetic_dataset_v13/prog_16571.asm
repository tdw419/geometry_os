; DESCRIPTION: Places a green line segment connecting (288, 162) to (14, 196).
; PLAN: r0=288(x1), r1=162(y1), r2=14(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 162
LDI r2, 14
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
