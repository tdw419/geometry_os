; DESCRIPTION: Composite: Places a yellow line segment connecting (416, 250) to (250, 128) then Places a purple circle of radius 64 at center (137, 155).
; PLAN: r0=416(x1), r1=250(y1), r2=250(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=155(y), r7=64(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 416
LDI r1, 250
LDI r2, 250
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 155
LDI r7, 64
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
