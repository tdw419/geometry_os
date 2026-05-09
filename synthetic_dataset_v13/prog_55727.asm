; DESCRIPTION: Places a yellow line segment connecting (308, 90) to (310, 96).
; PLAN: r0=308(x1), r1=90(y1), r2=310(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 90
LDI r2, 310
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
