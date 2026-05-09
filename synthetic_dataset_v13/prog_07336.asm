; DESCRIPTION: Places a white line segment connecting (341, 122) to (433, 139).
; PLAN: r0=341(x1), r1=122(y1), r2=433(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 122
LDI r2, 433
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
