; DESCRIPTION: Composite: Draws a purple rectangle at (107, 154) with width 74 and height 72 then Places a purple circle of radius 23 at center (92, 80) then Places a purple dot at position (54, 74).
; PLAN: r0=107(x), r1=154(y), r2=74(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x), r6=80(y), r7=23(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=54(x), r11=74(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 107
LDI r1, 154
LDI r2, 74
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 80
LDI r7, 23
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 54
LDI r11, 74
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
