; DESCRIPTION: Composite: Renders a red box of size 12x12 starting at (113, 3) then Draws a orange circle centered at (481, 92) with radius 29.
; PLAN: r0=113(x), r1=3(y), r2=12(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=481(x), r6=92(y), r7=29(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 113
LDI r1, 3
LDI r2, 12
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 92
LDI r7, 29
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
