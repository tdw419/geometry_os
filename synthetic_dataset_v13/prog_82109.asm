; DESCRIPTION: Composite: Renders a blue disk with center (466, 200) and radius 24 then Draws a magenta rectangle at (262, 15) with width 49 and height 34.
; PLAN: r0=466(x), r1=200(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=262(x), r6=15(y), r7=49(width), r8=34(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 466
LDI r1, 200
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 262
LDI r6, 15
LDI r7, 49
LDI r8, 34
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
