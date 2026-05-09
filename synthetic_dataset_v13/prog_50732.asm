; DESCRIPTION: Places a white line segment connecting (219, 217) to (22, 196).
; PLAN: r0=219(x1), r1=217(y1), r2=22(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 217
LDI r2, 22
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
