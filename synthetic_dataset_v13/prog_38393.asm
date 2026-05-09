; DESCRIPTION: Places a green line segment connecting (266, 110) to (253, 192).
; PLAN: r0=266(x1), r1=110(y1), r2=253(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 110
LDI r2, 253
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
