; DESCRIPTION: Places a white line segment connecting (358, 100) to (482, 21).
; PLAN: r0=358(x1), r1=100(y1), r2=482(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 100
LDI r2, 482
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
