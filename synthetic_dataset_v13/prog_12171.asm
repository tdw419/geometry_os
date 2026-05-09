; DESCRIPTION: Composite: Draws a yellow circle centered at (446, 64) with radius 21 then Draws a white rectangle at (200, 78) with width 97 and height 72.
; PLAN: r0=446(x), r1=64(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=200(x), r6=78(y), r7=97(width), r8=72(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 446
LDI r1, 64
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 200
LDI r6, 78
LDI r7, 97
LDI r8, 72
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
