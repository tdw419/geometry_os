; DESCRIPTION: Composite: Draws a yellow rectangle at (244, 96) with width 74 and height 101 then Sets a single white pixel at (61, 144).
; PLAN: r0=244(x), r1=96(y), r2=74(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=61(x), r6=144(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 244
LDI r1, 96
LDI r2, 74
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 144
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
