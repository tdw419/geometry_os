; DESCRIPTION: Places a yellow line segment connecting (299, 239) to (139, 1).
; PLAN: r0=299(x1), r1=239(y1), r2=139(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 239
LDI r2, 139
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
