; DESCRIPTION: Composite: Draws a red rectangle at (122, 195) with width 10 and height 36 then Places a magenta circle of radius 45 at center (275, 175).
; PLAN: r0=122(x), r1=195(y), r2=10(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=175(y), r7=45(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 122
LDI r1, 195
LDI r2, 10
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 175
LDI r7, 45
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
