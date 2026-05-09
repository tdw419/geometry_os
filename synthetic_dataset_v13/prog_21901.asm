; DESCRIPTION: Places a white line segment connecting (228, 167) to (228, 194).
; PLAN: r0=228(x1), r1=167(y1), r2=228(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 167
LDI r2, 228
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
