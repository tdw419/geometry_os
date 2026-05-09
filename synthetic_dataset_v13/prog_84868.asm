; DESCRIPTION: Composite: Draws a yellow circle centered at (190, 103) with radius 63 then Draws a black rectangle at (346, 143) with width 85 and height 95.
; PLAN: r0=190(x), r1=103(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x), r6=143(y), r7=85(width), r8=95(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 190
LDI r1, 103
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 143
LDI r7, 85
LDI r8, 95
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
