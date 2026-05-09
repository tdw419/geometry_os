; DESCRIPTION: Places a yellow line segment connecting (274, 12) to (296, 163).
; PLAN: r0=274(x1), r1=12(y1), r2=296(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 12
LDI r2, 296
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
