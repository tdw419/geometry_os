; DESCRIPTION: Composite: Creates a blue circular shape at (324, 74) with radius 72 then Places a magenta dot at position (429, 143) then Draws a red rectangle at (28, 149) with width 100 and height 83.
; PLAN: r0=324(x), r1=74(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=429(x), r6=143(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=28(x), r11=149(y), r12=100(width), r13=83(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 74
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 429
LDI r6, 143
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 28
LDI r11, 149
LDI r12, 100
LDI r13, 83
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
