; DESCRIPTION: Places a white line segment connecting (307, 48) to (157, 183).
; PLAN: r0=307(x1), r1=48(y1), r2=157(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 48
LDI r2, 157
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
