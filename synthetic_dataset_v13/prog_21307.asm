; DESCRIPTION: Places a yellow line segment connecting (499, 172) to (89, 139).
; PLAN: r0=499(x1), r1=172(y1), r2=89(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 172
LDI r2, 89
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
