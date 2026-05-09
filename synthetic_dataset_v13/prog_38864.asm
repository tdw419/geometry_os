; DESCRIPTION: Composite: Places a red dot at position (238, 130) then Draws a black circle centered at (44, 20) with radius 10 then Places a blue 114x89 rectangle at position (33, 130).
; PLAN: r0=238(x), r1=130(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=44(x), r6=20(y), r7=10(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=33(x), r11=130(y), r12=114(width), r13=89(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 238
LDI r1, 130
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 44
LDI r6, 20
LDI r7, 10
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 33
LDI r11, 130
LDI r12, 114
LDI r13, 89
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
