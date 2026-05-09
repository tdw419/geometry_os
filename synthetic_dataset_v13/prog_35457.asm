; DESCRIPTION: Composite: Draws a green circle centered at (100, 111) with radius 45 then Draws a white rectangle at (163, 68) with width 36 and height 87.
; PLAN: r0=100(x), r1=111(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=163(x), r6=68(y), r7=36(width), r8=87(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 111
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 163
LDI r6, 68
LDI r7, 36
LDI r8, 87
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
