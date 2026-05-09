; DESCRIPTION: Composite: Draws a yellow rectangle at (465, 110) with width 13 and height 113 then Places a purple circle of radius 58 at center (141, 99).
; PLAN: r0=465(x), r1=110(y), r2=13(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x), r6=99(y), r7=58(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 465
LDI r1, 110
LDI r2, 13
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 99
LDI r7, 58
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
