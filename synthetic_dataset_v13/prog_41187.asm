; DESCRIPTION: Places a yellow line segment connecting (194, 58) to (418, 113).
; PLAN: r0=194(x1), r1=58(y1), r2=418(x2), r3=113(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 58
LDI r2, 418
LDI r3, 113
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
