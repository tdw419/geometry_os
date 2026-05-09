; DESCRIPTION: Places a red line segment connecting (498, 86) to (104, 78).
; PLAN: r0=498(x1), r1=86(y1), r2=104(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 86
LDI r2, 104
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
