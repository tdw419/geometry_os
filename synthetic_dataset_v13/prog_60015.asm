; DESCRIPTION: Places a white line segment connecting (207, 212) to (297, 195).
; PLAN: r0=207(x1), r1=212(y1), r2=297(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 212
LDI r2, 297
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
