; DESCRIPTION: Places a green line segment connecting (229, 225) to (498, 248).
; PLAN: r0=229(x1), r1=225(y1), r2=498(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 225
LDI r2, 498
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
