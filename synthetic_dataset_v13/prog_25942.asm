; DESCRIPTION: Composite: Creates a white rectangular region at (374, 80) spanning 39 by 76 pixels then Draws a magenta circle centered at (191, 27) with radius 25.
; PLAN: r0=374(x), r1=80(y), r2=39(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x), r6=27(y), r7=25(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 374
LDI r1, 80
LDI r2, 39
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 27
LDI r7, 25
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
