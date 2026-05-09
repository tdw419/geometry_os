; DESCRIPTION: Places a green line segment connecting (140, 211) to (141, 138).
; PLAN: r0=140(x1), r1=211(y1), r2=141(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 211
LDI r2, 141
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
