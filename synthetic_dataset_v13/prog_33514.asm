; DESCRIPTION: Places a black line segment connecting (123, 135) to (56, 73).
; PLAN: r0=123(x1), r1=135(y1), r2=56(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 135
LDI r2, 56
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
