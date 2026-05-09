; DESCRIPTION: Composite: Renders a purple disk with center (47, 182) and radius 12 then Renders a blue box of size 101x10 starting at (391, 151) then Places a white dot at position (15, 182).
; PLAN: r0=47(x), r1=182(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x), r6=151(y), r7=101(width), r8=10(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=15(x), r11=182(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 47
LDI r1, 182
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 151
LDI r7, 101
LDI r8, 10
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 15
LDI r11, 182
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
