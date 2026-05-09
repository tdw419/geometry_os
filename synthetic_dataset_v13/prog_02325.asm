; DESCRIPTION: Places a yellow line segment connecting (221, 111) to (506, 74).
; PLAN: r0=221(x1), r1=111(y1), r2=506(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 111
LDI r2, 506
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
