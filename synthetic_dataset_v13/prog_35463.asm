; DESCRIPTION: Composite: Draws a white circle centered at (231, 135) with radius 45 then Draws a cyan rectangle at (205, 134) with width 81 and height 114.
; PLAN: r0=231(x), r1=135(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=205(x), r6=134(y), r7=81(width), r8=114(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 231
LDI r1, 135
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 205
LDI r6, 134
LDI r7, 81
LDI r8, 114
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
