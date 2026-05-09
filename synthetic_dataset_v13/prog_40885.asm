; DESCRIPTION: Composite: Renders a green disk with center (244, 27) and radius 16 then Draws a magenta rectangle at (107, 20) with width 37 and height 101.
; PLAN: r0=244(x), r1=27(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=107(x), r6=20(y), r7=37(width), r8=101(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 27
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 107
LDI r6, 20
LDI r7, 37
LDI r8, 101
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
