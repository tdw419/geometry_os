; DESCRIPTION: Composite: Renders a magenta disk with center (175, 208) and radius 12 then Draws a purple rectangle at (15, 117) with width 60 and height 82.
; PLAN: r0=175(x), r1=208(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=117(y), r7=60(width), r8=82(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 175
LDI r1, 208
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 117
LDI r7, 60
LDI r8, 82
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
