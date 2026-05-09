; DESCRIPTION: Composite: Draws a white circle centered at (367, 154) with radius 65 then Draws a purple rectangle at (477, 28) with width 29 and height 90.
; PLAN: r0=367(x), r1=154(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=477(x), r6=28(y), r7=29(width), r8=90(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 367
LDI r1, 154
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 477
LDI r6, 28
LDI r7, 29
LDI r8, 90
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
