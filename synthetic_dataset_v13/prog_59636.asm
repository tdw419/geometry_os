; DESCRIPTION: Composite: Draws a magenta rectangle at (322, 52) with width 70 and height 87 then Places a yellow circle of radius 34 at center (234, 131).
; PLAN: r0=322(x), r1=52(y), r2=70(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x), r6=131(y), r7=34(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 322
LDI r1, 52
LDI r2, 70
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 131
LDI r7, 34
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
