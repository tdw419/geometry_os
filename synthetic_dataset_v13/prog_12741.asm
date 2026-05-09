; DESCRIPTION: Places a yellow line segment connecting (395, 149) to (5, 33).
; PLAN: r0=395(x1), r1=149(y1), r2=5(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 149
LDI r2, 5
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
