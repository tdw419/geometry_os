; DESCRIPTION: Places a red line segment connecting (237, 89) to (447, 206).
; PLAN: r0=237(x1), r1=89(y1), r2=447(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 89
LDI r2, 447
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
