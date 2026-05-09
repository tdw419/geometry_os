; DESCRIPTION: Composite: Renders a yellow disk with center (54, 167) and radius 54 then Draws a cyan rectangle at (207, 103) with width 88 and height 113.
; PLAN: r0=54(x), r1=167(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x), r6=103(y), r7=88(width), r8=113(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 54
LDI r1, 167
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 103
LDI r7, 88
LDI r8, 113
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
