; DESCRIPTION: Places a black line segment connecting (137, 233) to (92, 23).
; PLAN: r0=137(x1), r1=233(y1), r2=92(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 233
LDI r2, 92
LDI r3, 23
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
