; DESCRIPTION: Composite: Creates a red circular shape at (156, 208) with radius 38 then Draws a blue rectangle at (184, 8) with width 106 and height 60.
; PLAN: r0=156(x), r1=208(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x), r6=8(y), r7=106(width), r8=60(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 208
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 8
LDI r7, 106
LDI r8, 60
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
