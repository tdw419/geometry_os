; DESCRIPTION: Places a green line segment connecting (457, 225) to (265, 233).
; PLAN: r0=457(x1), r1=225(y1), r2=265(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 225
LDI r2, 265
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
