; DESCRIPTION: Places a yellow line segment connecting (139, 14) to (191, 173).
; PLAN: r0=139(x1), r1=14(y1), r2=191(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 14
LDI r2, 191
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
