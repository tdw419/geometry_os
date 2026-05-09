; DESCRIPTION: Composite: Renders a red box of size 108x113 starting at (363, 121) then Draws a magenta circle centered at (456, 90) with radius 10.
; PLAN: r0=363(x), r1=121(y), r2=108(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=90(y), r7=10(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 363
LDI r1, 121
LDI r2, 108
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 90
LDI r7, 10
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
