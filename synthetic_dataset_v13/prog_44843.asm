; DESCRIPTION: Composite: Places a white circle of radius 49 at center (264, 111) then Draws a purple rectangle at (345, 102) with width 92 and height 65.
; PLAN: r0=264(x), r1=111(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=345(x), r6=102(y), r7=92(width), r8=65(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 111
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 345
LDI r6, 102
LDI r7, 92
LDI r8, 65
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
