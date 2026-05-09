; DESCRIPTION: Places a white line segment connecting (103, 58) to (31, 248).
; PLAN: r0=103(x1), r1=58(y1), r2=31(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 58
LDI r2, 31
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
