; DESCRIPTION: Places a yellow line segment connecting (139, 207) to (446, 112).
; PLAN: r0=139(x1), r1=207(y1), r2=446(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 207
LDI r2, 446
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
