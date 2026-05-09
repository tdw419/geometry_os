; DESCRIPTION: Places a yellow line segment connecting (111, 2) to (74, 49).
; PLAN: r0=111(x1), r1=2(y1), r2=74(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 2
LDI r2, 74
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
