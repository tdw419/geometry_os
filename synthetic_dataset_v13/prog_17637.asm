; DESCRIPTION: Composite: Draws a red rectangle at (146, 39) with width 77 and height 43 then Renders a black disk with center (137, 89) and radius 62.
; PLAN: r0=146(x), r1=39(y), r2=77(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x), r6=89(y), r7=62(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 146
LDI r1, 39
LDI r2, 77
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 89
LDI r7, 62
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
