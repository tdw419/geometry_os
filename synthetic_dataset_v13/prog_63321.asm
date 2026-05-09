; DESCRIPTION: Composite: Places a black circle of radius 55 at center (205, 92) then Draws a purple rectangle at (366, 111) with width 58 and height 113.
; PLAN: r0=205(x), r1=92(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=366(x), r6=111(y), r7=58(width), r8=113(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 205
LDI r1, 92
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 366
LDI r6, 111
LDI r7, 58
LDI r8, 113
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
