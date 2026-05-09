; DESCRIPTION: Composite: Places a magenta circle of radius 31 at center (309, 172) then Places a white dot at position (292, 66) then Renders a magenta box of size 67x15 starting at (139, 72).
; PLAN: r0=309(x), r1=172(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x), r6=66(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=139(x), r11=72(y), r12=67(width), r13=15(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 172
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 66
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 139
LDI r11, 72
LDI r12, 67
LDI r13, 15
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
