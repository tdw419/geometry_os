; DESCRIPTION: Places a white line segment connecting (274, 68) to (143, 167).
; PLAN: r0=274(x1), r1=68(y1), r2=143(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 68
LDI r2, 143
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
