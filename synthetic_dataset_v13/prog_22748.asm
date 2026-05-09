; DESCRIPTION: Places a red line segment connecting (225, 18) to (339, 192).
; PLAN: r0=225(x1), r1=18(y1), r2=339(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 18
LDI r2, 339
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
