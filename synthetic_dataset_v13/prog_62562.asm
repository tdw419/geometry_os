; DESCRIPTION: Places a white line segment connecting (63, 92) to (505, 251).
; PLAN: r0=63(x1), r1=92(y1), r2=505(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 92
LDI r2, 505
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
