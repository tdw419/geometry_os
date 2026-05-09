; DESCRIPTION: Places a green line segment connecting (294, 201) to (297, 212).
; PLAN: r0=294(x1), r1=201(y1), r2=297(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 201
LDI r2, 297
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
