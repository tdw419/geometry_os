; DESCRIPTION: Places a orange line segment connecting (186, 112) to (257, 202).
; PLAN: r0=186(x1), r1=112(y1), r2=257(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 112
LDI r2, 257
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
