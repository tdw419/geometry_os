; DESCRIPTION: Composite: Draws a yellow rectangle at (122, 202) with width 115 and height 24 then Places a green dot at position (29, 182).
; PLAN: r0=122(x), r1=202(y), r2=115(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=29(x), r6=182(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 122
LDI r1, 202
LDI r2, 115
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 182
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
