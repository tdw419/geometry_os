; DESCRIPTION: Composite: Creates a purple rectangular region at (247, 92) spanning 28 by 93 pixels then Draws a yellow circle centered at (404, 44) with radius 13.
; PLAN: r0=247(x), r1=92(y), r2=28(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=404(x), r6=44(y), r7=13(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 247
LDI r1, 92
LDI r2, 28
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 44
LDI r7, 13
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
