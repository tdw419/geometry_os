; DESCRIPTION: Places a cyan line segment connecting (109, 147) to (5, 183).
; PLAN: r0=109(x1), r1=147(y1), r2=5(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 147
LDI r2, 5
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
