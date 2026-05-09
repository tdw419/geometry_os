; DESCRIPTION: Composite: Draws a magenta circle centered at (83, 223) with radius 22 then Places a purple 110x46 rectangle at position (339, 0).
; PLAN: r0=83(x), r1=223(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=339(x), r6=0(y), r7=110(width), r8=46(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 83
LDI r1, 223
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 339
LDI r6, 0
LDI r7, 110
LDI r8, 46
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
