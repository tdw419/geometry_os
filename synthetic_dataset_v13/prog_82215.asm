; DESCRIPTION: Composite: Renders a magenta disk with center (284, 56) and radius 15 then Draws a green rectangle at (274, 101) with width 41 and height 105 then Renders a cyan line between points (143, 183) and (297, 247).
; PLAN: r0=284(x), r1=56(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x), r6=101(y), r7=41(width), r8=105(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=143(x1), r11=183(y1), r12=297(x2), r13=247(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 56
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 101
LDI r7, 41
LDI r8, 105
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 143
LDI r11, 183
LDI r12, 297
LDI r13, 247
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
