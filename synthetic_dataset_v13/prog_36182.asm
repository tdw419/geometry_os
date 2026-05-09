; DESCRIPTION: Composite: Renders a blue box of size 76x74 starting at (301, 39) then Draws a magenta circle centered at (446, 50) with radius 43.
; PLAN: r0=301(x), r1=39(y), r2=76(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=50(y), r7=43(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 301
LDI r1, 39
LDI r2, 76
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 50
LDI r7, 43
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
