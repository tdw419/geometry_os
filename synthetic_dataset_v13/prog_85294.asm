; DESCRIPTION: Composite: Creates a red rectangular region at (166, 182) spanning 96 by 56 pixels then Places a blue dot at position (468, 29) then Places a purple circle of radius 11 at center (123, 66).
; PLAN: r0=166(x), r1=182(y), r2=96(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x), r6=29(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=123(x), r11=66(y), r12=11(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 166
LDI r1, 182
LDI r2, 96
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 29
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 123
LDI r11, 66
LDI r12, 11
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
