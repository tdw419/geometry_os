; DESCRIPTION: Composite: Draws a purple rectangle at (456, 38) with width 24 and height 47 then Places a magenta circle of radius 40 at center (357, 188).
; PLAN: r0=456(x), r1=38(y), r2=24(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=357(x), r6=188(y), r7=40(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 456
LDI r1, 38
LDI r2, 24
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 188
LDI r7, 40
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
