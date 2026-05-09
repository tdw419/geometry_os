; DESCRIPTION: Places a white line segment connecting (506, 204) to (228, 88).
; PLAN: r0=506(x1), r1=204(y1), r2=228(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 204
LDI r2, 228
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
