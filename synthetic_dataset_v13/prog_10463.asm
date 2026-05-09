; DESCRIPTION: Places a white line segment connecting (291, 61) to (35, 75).
; PLAN: r0=291(x1), r1=61(y1), r2=35(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 61
LDI r2, 35
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
