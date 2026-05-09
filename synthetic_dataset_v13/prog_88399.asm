; DESCRIPTION: Composite: Draws a orange rectangle at (1, 72) with width 66 and height 78 then Places a red circle of radius 71 at center (127, 90).
; PLAN: r0=1(x), r1=72(y), r2=66(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x), r6=90(y), r7=71(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 1
LDI r1, 72
LDI r2, 66
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 90
LDI r7, 71
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
