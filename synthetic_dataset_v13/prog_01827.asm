; DESCRIPTION: Places a red line segment connecting (164, 30) to (94, 72).
; PLAN: r0=164(x1), r1=30(y1), r2=94(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 30
LDI r2, 94
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
