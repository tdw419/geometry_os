; DESCRIPTION: Composite: Creates a cyan circular shape at (192, 117) with radius 34 then Draws a black rectangle at (121, 155) with width 105 and height 19.
; PLAN: r0=192(x), r1=117(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=121(x), r6=155(y), r7=105(width), r8=19(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 192
LDI r1, 117
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 121
LDI r6, 155
LDI r7, 105
LDI r8, 19
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
