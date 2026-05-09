; DESCRIPTION: Places a yellow line segment connecting (251, 232) to (470, 246).
; PLAN: r0=251(x1), r1=232(y1), r2=470(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 232
LDI r2, 470
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
