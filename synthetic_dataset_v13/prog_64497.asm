; DESCRIPTION: Places a white line segment connecting (257, 247) to (353, 52).
; PLAN: r0=257(x1), r1=247(y1), r2=353(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 247
LDI r2, 353
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
