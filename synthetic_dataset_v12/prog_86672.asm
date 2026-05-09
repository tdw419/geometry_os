; DESCRIPTION: Places a red line segment connecting (214, 3) to (402, 109).
; PLAN: r0=214(x1), r1=3(y1), r2=402(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 3
LDI r2, 402
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
