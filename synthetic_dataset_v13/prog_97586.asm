; DESCRIPTION: Places a red line segment connecting (78, 167) to (130, 45).
; PLAN: r0=78(x1), r1=167(y1), r2=130(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 167
LDI r2, 130
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
