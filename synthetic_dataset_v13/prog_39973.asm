; DESCRIPTION: Places a white line segment connecting (341, 8) to (462, 199).
; PLAN: r0=341(x1), r1=8(y1), r2=462(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 8
LDI r2, 462
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
