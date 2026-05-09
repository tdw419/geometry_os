; DESCRIPTION: Places a green line segment connecting (177, 247) to (100, 97).
; PLAN: r0=177(x1), r1=247(y1), r2=100(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 247
LDI r2, 100
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
