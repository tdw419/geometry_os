; DESCRIPTION: Composite: Creates a magenta rectangular region at (142, 155) spanning 18 by 90 pixels then Draws a red circle centered at (367, 98) with radius 47.
; PLAN: r0=142(x), r1=155(y), r2=18(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=367(x), r6=98(y), r7=47(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 142
LDI r1, 155
LDI r2, 18
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 98
LDI r7, 47
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
