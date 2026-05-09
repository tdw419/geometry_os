; DESCRIPTION: Composite: Renders a magenta disk with center (457, 74) and radius 47 then Draws a purple rectangle at (80, 81) with width 46 and height 73.
; PLAN: r0=457(x), r1=74(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=80(x), r6=81(y), r7=46(width), r8=73(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 457
LDI r1, 74
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 80
LDI r6, 81
LDI r7, 46
LDI r8, 73
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
