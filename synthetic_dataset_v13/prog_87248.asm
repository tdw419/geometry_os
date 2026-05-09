; DESCRIPTION: Places a black line segment connecting (414, 211) to (95, 52).
; PLAN: r0=414(x1), r1=211(y1), r2=95(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 211
LDI r2, 95
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
