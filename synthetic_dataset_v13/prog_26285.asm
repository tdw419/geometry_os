; DESCRIPTION: Composite: Renders a magenta disk with center (207, 38) and radius 38 then Draws a green rectangle at (333, 5) with width 107 and height 111.
; PLAN: r0=207(x), r1=38(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=333(x), r6=5(y), r7=107(width), r8=111(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 207
LDI r1, 38
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 333
LDI r6, 5
LDI r7, 107
LDI r8, 111
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
