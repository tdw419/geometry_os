; DESCRIPTION: Places a yellow line segment connecting (194, 72) to (177, 192).
; PLAN: r0=194(x1), r1=72(y1), r2=177(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 72
LDI r2, 177
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
