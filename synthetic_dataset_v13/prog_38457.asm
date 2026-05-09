; DESCRIPTION: Places a green line segment connecting (104, 56) to (412, 95).
; PLAN: r0=104(x1), r1=56(y1), r2=412(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 56
LDI r2, 412
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
