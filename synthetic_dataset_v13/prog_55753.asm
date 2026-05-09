; DESCRIPTION: Composite: Draws a black rectangle at (103, 163) with width 116 and height 17 then Places a green dot at position (228, 129).
; PLAN: r0=103(x), r1=163(y), r2=116(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=228(x), r6=129(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 103
LDI r1, 163
LDI r2, 116
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 129
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
