; DESCRIPTION: Composite: Draws a orange circle centered at (127, 121) with radius 79 then Draws a purple rectangle at (444, 116) with width 64 and height 115.
; PLAN: r0=127(x), r1=121(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=444(x), r6=116(y), r7=64(width), r8=115(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 127
LDI r1, 121
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 444
LDI r6, 116
LDI r7, 64
LDI r8, 115
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
