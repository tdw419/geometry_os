; DESCRIPTION: Composite: Renders a purple box of size 68x28 starting at (170, 136) then Places a white circle of radius 74 at center (368, 156) then Places a blue dot at position (363, 139).
; PLAN: r0=170(x), r1=136(y), r2=68(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=156(y), r7=74(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=363(x), r11=139(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 170
LDI r1, 136
LDI r2, 68
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 156
LDI r7, 74
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 363
LDI r11, 139
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
