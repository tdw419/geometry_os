; DESCRIPTION: Places a red line segment connecting (402, 214) to (358, 176).
; PLAN: r0=402(x1), r1=214(y1), r2=358(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 214
LDI r2, 358
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
