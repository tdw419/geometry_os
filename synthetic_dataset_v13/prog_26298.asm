; DESCRIPTION: Renders a white line between points (447, 104) and (136, 150).
; PLAN: r0=447(x1), r1=104(y1), r2=136(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 104
LDI r2, 136
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
