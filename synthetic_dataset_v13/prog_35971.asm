; DESCRIPTION: Places a yellow line segment connecting (96, 33) to (38, 137).
; PLAN: r0=96(x1), r1=33(y1), r2=38(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 33
LDI r2, 38
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
