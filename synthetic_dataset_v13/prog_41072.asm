; DESCRIPTION: Composite: Renders a yellow disk with center (306, 114) and radius 16 then Sets a single blue pixel at (250, 187) then Draws a red rectangle at (315, 186) with width 14 and height 44.
; PLAN: r0=306(x), r1=114(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x), r6=187(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=315(x), r11=186(y), r12=14(width), r13=44(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 306
LDI r1, 114
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 187
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 315
LDI r11, 186
LDI r12, 14
LDI r13, 44
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
