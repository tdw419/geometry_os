; DESCRIPTION: Places a yellow line segment connecting (111, 10) to (395, 196).
; PLAN: r0=111(x1), r1=10(y1), r2=395(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 10
LDI r2, 395
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
