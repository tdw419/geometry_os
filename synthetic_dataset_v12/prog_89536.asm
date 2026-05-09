; DESCRIPTION: Composite: Renders a black disk with center (409, 182) and radius 47 then Draws a green rectangle at (95, 73) with width 48 and height 28.
; PLAN: r0=409(x), r1=182(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=95(x), r6=73(y), r7=48(width), r8=28(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 182
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 95
LDI r6, 73
LDI r7, 48
LDI r8, 28
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
