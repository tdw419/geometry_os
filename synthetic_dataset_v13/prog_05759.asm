; DESCRIPTION: Composite: Draws a black rectangle at (286, 169) with width 20 and height 45 then Sets a single cyan pixel at (124, 198) then Places a yellow circle of radius 59 at center (153, 115).
; PLAN: r0=286(x), r1=169(y), r2=20(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=124(x), r6=198(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=153(x), r11=115(y), r12=59(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 286
LDI r1, 169
LDI r2, 20
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 198
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 153
LDI r11, 115
LDI r12, 59
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
