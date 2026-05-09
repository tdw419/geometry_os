; DESCRIPTION: Places a green line segment connecting (463, 248) to (162, 206).
; PLAN: r0=463(x1), r1=248(y1), r2=162(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 248
LDI r2, 162
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
