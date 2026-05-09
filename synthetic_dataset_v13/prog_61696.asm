; DESCRIPTION: Places a yellow line segment connecting (54, 112) to (307, 240).
; PLAN: r0=54(x1), r1=112(y1), r2=307(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 112
LDI r2, 307
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
