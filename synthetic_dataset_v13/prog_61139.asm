; DESCRIPTION: Places a yellow line segment connecting (506, 36) to (5, 117).
; PLAN: r0=506(x1), r1=36(y1), r2=5(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 36
LDI r2, 5
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
