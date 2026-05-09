; DESCRIPTION: Places a white line segment connecting (96, 156) to (204, 71).
; PLAN: r0=96(x1), r1=156(y1), r2=204(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 156
LDI r2, 204
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
