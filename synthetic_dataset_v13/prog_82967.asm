; DESCRIPTION: Places a yellow line segment connecting (221, 208) to (106, 230).
; PLAN: r0=221(x1), r1=208(y1), r2=106(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 208
LDI r2, 106
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
