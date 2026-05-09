; DESCRIPTION: Places a yellow line segment connecting (30, 202) to (30, 90).
; PLAN: r0=30(x1), r1=202(y1), r2=30(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 202
LDI r2, 30
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
