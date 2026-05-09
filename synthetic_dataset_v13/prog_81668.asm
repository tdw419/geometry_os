; DESCRIPTION: Places a yellow line segment connecting (77, 106) to (16, 254).
; PLAN: r0=77(x1), r1=106(y1), r2=16(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 106
LDI r2, 16
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
