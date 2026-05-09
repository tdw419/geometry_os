; DESCRIPTION: Places a green line segment connecting (269, 80) to (72, 2).
; PLAN: r0=269(x1), r1=80(y1), r2=72(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 80
LDI r2, 72
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
