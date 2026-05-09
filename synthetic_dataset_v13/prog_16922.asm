; DESCRIPTION: Places a green line segment connecting (284, 118) to (199, 217).
; PLAN: r0=284(x1), r1=118(y1), r2=199(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 118
LDI r2, 199
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
