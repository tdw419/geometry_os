; DESCRIPTION: Composite: Creates a yellow circular shape at (112, 239) with radius 12 then Draws a blue rectangle at (192, 94) with width 54 and height 56.
; PLAN: r0=112(x), r1=239(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x), r6=94(y), r7=54(width), r8=56(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 112
LDI r1, 239
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 94
LDI r7, 54
LDI r8, 56
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
