; DESCRIPTION: Composite: Creates a magenta rectangular region at (340, 139) spanning 89 by 95 pixels then Draws a purple circle centered at (433, 82) with radius 20.
; PLAN: r0=340(x), r1=139(y), r2=89(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x), r6=82(y), r7=20(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 340
LDI r1, 139
LDI r2, 89
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 82
LDI r7, 20
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
