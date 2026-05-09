; DESCRIPTION: Composite: Draws a red circle centered at (216, 130) with radius 53 then Creates a magenta rectangular region at (226, 49) spanning 97 by 107 pixels.
; PLAN: r0=216(x), r1=130(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x), r6=49(y), r7=97(width), r8=107(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 216
LDI r1, 130
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 49
LDI r7, 97
LDI r8, 107
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
