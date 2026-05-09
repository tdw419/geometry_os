; DESCRIPTION: Places a yellow line segment connecting (161, 140) to (177, 8).
; PLAN: r0=161(x1), r1=140(y1), r2=177(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 140
LDI r2, 177
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
