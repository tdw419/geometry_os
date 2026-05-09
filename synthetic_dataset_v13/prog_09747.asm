; DESCRIPTION: Places a white line segment connecting (179, 117) to (260, 183).
; PLAN: r0=179(x1), r1=117(y1), r2=260(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 117
LDI r2, 260
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
