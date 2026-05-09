; DESCRIPTION: Places a yellow line segment connecting (405, 251) to (112, 202).
; PLAN: r0=405(x1), r1=251(y1), r2=112(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 251
LDI r2, 112
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
