; DESCRIPTION: Composite: Sets a single yellow pixel at (477, 39) then Renders a orange disk with center (104, 136) and radius 67 then Places a red 20x118 rectangle at position (134, 53).
; PLAN: r0=477(x), r1=39(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=104(x), r6=136(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=134(x), r11=53(y), r12=20(width), r13=118(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 477
LDI r1, 39
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 104
LDI r6, 136
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 134
LDI r11, 53
LDI r12, 20
LDI r13, 118
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
