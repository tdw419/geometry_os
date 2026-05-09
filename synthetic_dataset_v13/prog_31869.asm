; DESCRIPTION: Composite: Draws a purple rectangle at (201, 82) with width 42 and height 39 then Renders a magenta disk with center (37, 164) and radius 17.
; PLAN: r0=201(x), r1=82(y), r2=42(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=37(x), r6=164(y), r7=17(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 201
LDI r1, 82
LDI r2, 42
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 164
LDI r7, 17
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
