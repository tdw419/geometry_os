; DESCRIPTION: Places a red line segment connecting (432, 164) to (285, 64).
; PLAN: r0=432(x1), r1=164(y1), r2=285(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 164
LDI r2, 285
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
