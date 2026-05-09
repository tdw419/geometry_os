; DESCRIPTION: Composite: Renders a purple disk with center (73, 182) and radius 18 then Sets a single cyan pixel at (35, 194) then Draws a cyan rectangle at (43, 114) with width 23 and height 24.
; PLAN: r0=73(x), r1=182(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=35(x), r6=194(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=43(x), r11=114(y), r12=23(width), r13=24(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 73
LDI r1, 182
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 35
LDI r6, 194
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 43
LDI r11, 114
LDI r12, 23
LDI r13, 24
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
