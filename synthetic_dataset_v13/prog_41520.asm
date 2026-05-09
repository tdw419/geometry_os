; DESCRIPTION: Composite: Places a yellow 69x90 rectangle at position (341, 118) then Renders a orange disk with center (329, 104) and radius 76.
; PLAN: r0=341(x), r1=118(y), r2=69(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x), r6=104(y), r7=76(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 118
LDI r2, 69
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 104
LDI r7, 76
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
