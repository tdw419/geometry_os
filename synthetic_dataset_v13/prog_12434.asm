; DESCRIPTION: Places a yellow line segment connecting (506, 72) to (72, 237).
; PLAN: r0=506(x1), r1=72(y1), r2=72(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 72
LDI r2, 72
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
