; DESCRIPTION: Composite: Draws a red circle centered at (370, 62) with radius 28 then Sets a single purple pixel at (226, 44) then Renders a black box of size 111x10 starting at (195, 175).
; PLAN: r0=370(x), r1=62(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x), r6=44(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=195(x), r11=175(y), r12=111(width), r13=10(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 62
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 44
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 195
LDI r11, 175
LDI r12, 111
LDI r13, 10
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
