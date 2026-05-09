; DESCRIPTION: Places a green line segment connecting (490, 228) to (178, 0).
; PLAN: r0=490(x1), r1=228(y1), r2=178(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 228
LDI r2, 178
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
