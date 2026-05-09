; DESCRIPTION: Composite: Draws a black rectangle at (12, 127) with width 90 and height 101 then Places a yellow circle of radius 18 at center (292, 27).
; PLAN: r0=12(x), r1=127(y), r2=90(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=292(x), r6=27(y), r7=18(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 12
LDI r1, 127
LDI r2, 90
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 27
LDI r7, 18
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
