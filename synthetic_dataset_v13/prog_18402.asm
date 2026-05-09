; DESCRIPTION: Places a yellow line segment connecting (163, 1) to (386, 20).
; PLAN: r0=163(x1), r1=1(y1), r2=386(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 1
LDI r2, 386
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
