; DESCRIPTION: Composite: Draws a yellow rectangle at (253, 173) with width 106 and height 81 then Sets a single purple pixel at (3, 0).
; PLAN: r0=253(x), r1=173(y), r2=106(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=3(x), r6=0(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 253
LDI r1, 173
LDI r2, 106
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 0
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
