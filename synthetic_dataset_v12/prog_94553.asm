; DESCRIPTION: Places a red line segment connecting (376, 104) to (459, 125).
; PLAN: r0=376(x1), r1=104(y1), r2=459(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 104
LDI r2, 459
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
