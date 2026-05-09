; DESCRIPTION: Places a yellow line segment connecting (206, 218) to (440, 183).
; PLAN: r0=206(x1), r1=218(y1), r2=440(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 218
LDI r2, 440
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
