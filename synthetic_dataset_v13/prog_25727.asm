; DESCRIPTION: Places a cyan line segment connecting (77, 172) to (297, 208).
; PLAN: r0=77(x1), r1=172(y1), r2=297(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 172
LDI r2, 297
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
