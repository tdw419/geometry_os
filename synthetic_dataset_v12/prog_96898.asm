; DESCRIPTION: Composite: Renders a yellow disk with center (213, 186) and radius 67 then Draws a purple rectangle at (461, 118) with width 33 and height 101.
; PLAN: r0=213(x), r1=186(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=461(x), r6=118(y), r7=33(width), r8=101(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 186
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 461
LDI r6, 118
LDI r7, 33
LDI r8, 101
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
