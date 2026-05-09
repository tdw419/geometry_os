; DESCRIPTION: Places a yellow line segment connecting (131, 159) to (385, 0).
; PLAN: r0=131(x1), r1=159(y1), r2=385(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 159
LDI r2, 385
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
