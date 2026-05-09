; DESCRIPTION: Places a white line segment connecting (396, 245) to (376, 195).
; PLAN: r0=396(x1), r1=245(y1), r2=376(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 245
LDI r2, 376
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
