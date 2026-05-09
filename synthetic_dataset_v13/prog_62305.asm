; DESCRIPTION: Composite: Draws a blue rectangle at (150, 50) with width 14 and height 50 then Draws a green circle centered at (104, 169) with radius 59.
; PLAN: r0=150(x), r1=50(y), r2=14(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=104(x), r6=169(y), r7=59(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 150
LDI r1, 50
LDI r2, 14
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 169
LDI r7, 59
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
