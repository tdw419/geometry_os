; DESCRIPTION: Places a black line segment connecting (287, 120) to (373, 78).
; PLAN: r0=287(x1), r1=120(y1), r2=373(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 120
LDI r2, 373
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
