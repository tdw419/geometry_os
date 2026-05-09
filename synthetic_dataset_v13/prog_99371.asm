; DESCRIPTION: Places a white line segment connecting (498, 118) to (24, 5).
; PLAN: r0=498(x1), r1=118(y1), r2=24(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 118
LDI r2, 24
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
