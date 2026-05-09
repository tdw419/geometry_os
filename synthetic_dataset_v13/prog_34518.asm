; DESCRIPTION: Places a black line segment connecting (287, 68) to (290, 176).
; PLAN: r0=287(x1), r1=68(y1), r2=290(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 68
LDI r2, 290
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
