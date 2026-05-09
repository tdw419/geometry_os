; DESCRIPTION: Places a white line segment connecting (257, 182) to (148, 178).
; PLAN: r0=257(x1), r1=182(y1), r2=148(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 182
LDI r2, 148
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
