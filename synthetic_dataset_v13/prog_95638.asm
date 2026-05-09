; DESCRIPTION: Composite: Draws a orange rectangle at (315, 98) with width 113 and height 64 then Draws a purple circle centered at (226, 116) with radius 77.
; PLAN: r0=315(x), r1=98(y), r2=113(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=226(x), r6=116(y), r7=77(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 315
LDI r1, 98
LDI r2, 113
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 116
LDI r7, 77
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
