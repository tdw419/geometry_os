; DESCRIPTION: Composite: Draws a red circle centered at (228, 137) with radius 77 then Draws a blue rectangle at (151, 182) with width 49 and height 20.
; PLAN: r0=228(x), r1=137(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x), r6=182(y), r7=49(width), r8=20(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 228
LDI r1, 137
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 182
LDI r7, 49
LDI r8, 20
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
