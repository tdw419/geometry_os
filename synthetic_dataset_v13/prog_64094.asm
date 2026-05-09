; DESCRIPTION: Places a cyan line segment connecting (390, 246) to (109, 204).
; PLAN: r0=390(x1), r1=246(y1), r2=109(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 246
LDI r2, 109
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
