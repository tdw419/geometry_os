; DESCRIPTION: Composite: Draws a white circle centered at (176, 206) with radius 36 then Draws a magenta rectangle at (149, 10) with width 15 and height 27.
; PLAN: r0=176(x), r1=206(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=149(x), r6=10(y), r7=15(width), r8=27(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 206
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 149
LDI r6, 10
LDI r7, 15
LDI r8, 27
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
