; DESCRIPTION: Places a cyan line segment connecting (61, 245) to (71, 104).
; PLAN: r0=61(x1), r1=245(y1), r2=71(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 245
LDI r2, 71
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
