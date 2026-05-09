; DESCRIPTION: Places a yellow line segment connecting (506, 150) to (72, 198).
; PLAN: r0=506(x1), r1=150(y1), r2=72(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 150
LDI r2, 72
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
