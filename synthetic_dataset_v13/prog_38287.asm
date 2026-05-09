; DESCRIPTION: Places a white line segment connecting (405, 141) to (498, 53).
; PLAN: r0=405(x1), r1=141(y1), r2=498(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 141
LDI r2, 498
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
