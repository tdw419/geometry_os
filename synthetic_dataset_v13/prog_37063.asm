; DESCRIPTION: Places a cyan line segment connecting (201, 167) to (116, 99).
; PLAN: r0=201(x1), r1=167(y1), r2=116(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 167
LDI r2, 116
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
