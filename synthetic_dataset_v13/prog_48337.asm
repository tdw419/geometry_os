; DESCRIPTION: Places a white line segment connecting (167, 202) to (64, 245).
; PLAN: r0=167(x1), r1=202(y1), r2=64(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 202
LDI r2, 64
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
