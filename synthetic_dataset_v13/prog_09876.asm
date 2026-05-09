; DESCRIPTION: Places a black line segment connecting (300, 6) to (486, 52).
; PLAN: r0=300(x1), r1=6(y1), r2=486(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 6
LDI r2, 486
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
