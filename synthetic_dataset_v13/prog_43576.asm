; DESCRIPTION: Composite: Draws a purple circle centered at (358, 120) with radius 78 then Places a cyan 49x17 rectangle at position (353, 98).
; PLAN: r0=358(x), r1=120(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x), r6=98(y), r7=49(width), r8=17(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 120
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 98
LDI r7, 49
LDI r8, 17
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
