; DESCRIPTION: Places a cyan line segment connecting (297, 8) to (163, 166).
; PLAN: r0=297(x1), r1=8(y1), r2=163(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 8
LDI r2, 163
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
