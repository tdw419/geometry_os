; DESCRIPTION: Places a white line segment connecting (45, 80) to (315, 109).
; PLAN: r0=45(x1), r1=80(y1), r2=315(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 80
LDI r2, 315
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
