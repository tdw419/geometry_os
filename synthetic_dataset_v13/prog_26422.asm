; DESCRIPTION: Composite: Renders a blue line between points (278, 170) and (344, 133) then Places a magenta circle of radius 56 at center (288, 62).
; PLAN: r0=278(x1), r1=170(y1), r2=344(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=62(y), r7=56(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 278
LDI r1, 170
LDI r2, 344
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 62
LDI r7, 56
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
