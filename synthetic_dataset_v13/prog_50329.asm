; DESCRIPTION: Places a yellow line segment connecting (442, 120) to (36, 194).
; PLAN: r0=442(x1), r1=120(y1), r2=36(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 120
LDI r2, 36
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
