; DESCRIPTION: Places a yellow line segment connecting (111, 22) to (309, 211).
; PLAN: r0=111(x1), r1=22(y1), r2=309(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 22
LDI r2, 309
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
