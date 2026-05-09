; DESCRIPTION: Composite: Creates a yellow rectangular region at (22, 81) spanning 113 by 110 pixels then Places a blue circle of radius 55 at center (326, 151).
; PLAN: r0=22(x), r1=81(y), r2=113(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=326(x), r6=151(y), r7=55(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 22
LDI r1, 81
LDI r2, 113
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 151
LDI r7, 55
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
