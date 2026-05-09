; DESCRIPTION: Composite: Draws a green rectangle at (293, 71) with width 24 and height 82 then Draws a red circle centered at (116, 143) with radius 11.
; PLAN: r0=293(x), r1=71(y), r2=24(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x), r6=143(y), r7=11(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 293
LDI r1, 71
LDI r2, 24
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 143
LDI r7, 11
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
