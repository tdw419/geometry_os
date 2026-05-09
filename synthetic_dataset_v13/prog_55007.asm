; DESCRIPTION: Places a black line segment connecting (323, 54) to (260, 120).
; PLAN: r0=323(x1), r1=54(y1), r2=260(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 54
LDI r2, 260
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
