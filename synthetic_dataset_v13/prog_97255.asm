; DESCRIPTION: Places a white line segment connecting (447, 7) to (50, 74).
; PLAN: r0=447(x1), r1=7(y1), r2=50(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 7
LDI r2, 50
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
