; DESCRIPTION: Composite: Renders a black disk with center (261, 127) and radius 39 then Draws a yellow rectangle at (61, 96) with width 31 and height 79.
; PLAN: r0=261(x), r1=127(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=61(x), r6=96(y), r7=31(width), r8=79(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 127
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 61
LDI r6, 96
LDI r7, 31
LDI r8, 79
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
