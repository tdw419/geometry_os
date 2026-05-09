; DESCRIPTION: Composite: Draws a black rectangle at (188, 28) with width 112 and height 70 then Sets a single green pixel at (222, 240).
; PLAN: r0=188(x), r1=28(y), r2=112(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=222(x), r6=240(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 188
LDI r1, 28
LDI r2, 112
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 240
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
