; DESCRIPTION: Renders a white line between points (447, 229) and (282, 3).
; PLAN: r0=447(x1), r1=229(y1), r2=282(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 229
LDI r2, 282
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
