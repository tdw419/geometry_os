; DESCRIPTION: Composite: Renders a purple box of size 90x83 starting at (347, 90) then Draws a black circle centered at (66, 182) with radius 59 then Places a red dot at position (263, 175).
; PLAN: r0=347(x), r1=90(y), r2=90(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x), r6=182(y), r7=59(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=263(x), r11=175(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 347
LDI r1, 90
LDI r2, 90
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 182
LDI r7, 59
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 263
LDI r11, 175
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
