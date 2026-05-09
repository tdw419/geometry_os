; DESCRIPTION: Composite: Draws a magenta rectangle at (301, 27) with width 42 and height 18 then Draws a white circle centered at (209, 115) with radius 76.
; PLAN: r0=301(x), r1=27(y), r2=42(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x), r6=115(y), r7=76(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 301
LDI r1, 27
LDI r2, 42
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 115
LDI r7, 76
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
