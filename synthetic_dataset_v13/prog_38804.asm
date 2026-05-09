; DESCRIPTION: Composite: Sets a single purple pixel at (26, 182) then Places a white circle of radius 35 at center (63, 66) then Renders a purple box of size 114x45 starting at (255, 51).
; PLAN: r0=26(x), r1=182(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=63(x), r6=66(y), r7=35(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=255(x), r11=51(y), r12=114(width), r13=45(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 26
LDI r1, 182
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 63
LDI r6, 66
LDI r7, 35
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 255
LDI r11, 51
LDI r12, 114
LDI r13, 45
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
