; DESCRIPTION: Composite: Draws a white circle centered at (93, 239) with radius 15 then Renders a purple box of size 37x24 starting at (94, 63).
; PLAN: r0=93(x), r1=239(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=94(x), r6=63(y), r7=37(width), r8=24(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 239
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 94
LDI r6, 63
LDI r7, 37
LDI r8, 24
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
