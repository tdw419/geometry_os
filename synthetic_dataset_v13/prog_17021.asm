; DESCRIPTION: Composite: Draws a magenta rectangle at (299, 17) with width 12 and height 65 then Renders a purple disk with center (221, 144) and radius 39.
; PLAN: r0=299(x), r1=17(y), r2=12(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=221(x), r6=144(y), r7=39(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 299
LDI r1, 17
LDI r2, 12
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 144
LDI r7, 39
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
