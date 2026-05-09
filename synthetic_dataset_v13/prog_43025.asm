; DESCRIPTION: Places a yellow line segment connecting (240, 191) to (307, 200).
; PLAN: r0=240(x1), r1=191(y1), r2=307(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 191
LDI r2, 307
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
