; DESCRIPTION: Composite: Places a red dot at position (19, 78) then Renders a blue disk with center (444, 102) and radius 45 then Draws a blue rectangle at (10, 134) with width 70 and height 86.
; PLAN: r0=19(x), r1=78(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=444(x), r6=102(y), r7=45(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=10(x), r11=134(y), r12=70(width), r13=86(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 19
LDI r1, 78
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 444
LDI r6, 102
LDI r7, 45
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 10
LDI r11, 134
LDI r12, 70
LDI r13, 86
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
