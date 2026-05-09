; DESCRIPTION: Places a red line segment connecting (109, 45) to (46, 3).
; PLAN: r0=109(x1), r1=45(y1), r2=46(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 45
LDI r2, 46
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
