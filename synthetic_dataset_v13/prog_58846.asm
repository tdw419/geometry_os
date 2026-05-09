; DESCRIPTION: Places a green line segment connecting (288, 10) to (149, 141).
; PLAN: r0=288(x1), r1=10(y1), r2=149(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 10
LDI r2, 149
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
