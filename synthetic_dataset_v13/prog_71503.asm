; DESCRIPTION: Places a cyan line segment connecting (414, 245) to (379, 183).
; PLAN: r0=414(x1), r1=245(y1), r2=379(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 245
LDI r2, 379
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
