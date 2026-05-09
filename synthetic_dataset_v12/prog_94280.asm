; DESCRIPTION: Composite: Draws a magenta rectangle at (310, 31) with width 27 and height 93 then Draws a purple circle centered at (445, 132) with radius 12.
; PLAN: r0=310(x), r1=31(y), r2=27(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x), r6=132(y), r7=12(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 310
LDI r1, 31
LDI r2, 27
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 132
LDI r7, 12
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
