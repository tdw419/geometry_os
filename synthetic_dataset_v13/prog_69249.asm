; DESCRIPTION: Places a yellow line segment connecting (341, 73) to (470, 172).
; PLAN: r0=341(x1), r1=73(y1), r2=470(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 73
LDI r2, 470
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
