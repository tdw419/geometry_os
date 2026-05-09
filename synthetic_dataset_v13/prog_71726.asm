; DESCRIPTION: Places a cyan line segment connecting (183, 140) to (347, 183).
; PLAN: r0=183(x1), r1=140(y1), r2=347(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 140
LDI r2, 347
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
