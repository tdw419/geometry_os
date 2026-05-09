; DESCRIPTION: Places a yellow line segment connecting (148, 1) to (292, 192).
; PLAN: r0=148(x1), r1=1(y1), r2=292(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 1
LDI r2, 292
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
