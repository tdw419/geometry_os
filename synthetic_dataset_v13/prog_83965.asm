; DESCRIPTION: Composite: Renders a yellow disk with center (364, 114) and radius 77 then Places a magenta dot at position (406, 2) then Draws a purple rectangle at (291, 51) with width 90 and height 70.
; PLAN: r0=364(x), r1=114(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x), r6=2(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=291(x), r11=51(y), r12=90(width), r13=70(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 114
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 2
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 291
LDI r11, 51
LDI r12, 90
LDI r13, 70
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
