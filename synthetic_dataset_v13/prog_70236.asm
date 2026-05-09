; DESCRIPTION: Places a blue line segment connecting (208, 165) to (31, 246).
; PLAN: r0=208(x1), r1=165(y1), r2=31(x2), r3=246(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 165
LDI r2, 31
LDI r3, 246
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
