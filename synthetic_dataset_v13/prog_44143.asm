; DESCRIPTION: Composite: Draws a white circle centered at (322, 53) with radius 12 then Draws a yellow rectangle at (274, 182) with width 40 and height 59.
; PLAN: r0=322(x), r1=53(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x), r6=182(y), r7=40(width), r8=59(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 53
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 182
LDI r7, 40
LDI r8, 59
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
