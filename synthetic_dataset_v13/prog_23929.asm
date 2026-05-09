; DESCRIPTION: Composite: Draws a purple rectangle at (131, 84) with width 98 and height 66 then Draws a cyan circle centered at (209, 106) with radius 33.
; PLAN: r0=131(x), r1=84(y), r2=98(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x), r6=106(y), r7=33(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 131
LDI r1, 84
LDI r2, 98
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 106
LDI r7, 33
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
