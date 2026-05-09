; DESCRIPTION: Composite: Places a yellow circle of radius 49 at center (246, 124) then Draws a purple rectangle at (148, 53) with width 101 and height 114 then Sets a single purple pixel at (18, 28).
; PLAN: r0=246(x), r1=124(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=148(x), r6=53(y), r7=101(width), r8=114(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=18(x), r11=28(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 246
LDI r1, 124
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 148
LDI r6, 53
LDI r7, 101
LDI r8, 114
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 18
LDI r11, 28
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
