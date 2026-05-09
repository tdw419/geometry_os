; DESCRIPTION: Places a white line segment connecting (311, 172) to (271, 248).
; PLAN: r0=311(x1), r1=172(y1), r2=271(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 172
LDI r2, 271
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
