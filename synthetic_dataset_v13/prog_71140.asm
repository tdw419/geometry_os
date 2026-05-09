; DESCRIPTION: Places a white line segment connecting (247, 8) to (85, 167).
; PLAN: r0=247(x1), r1=8(y1), r2=85(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 8
LDI r2, 85
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
