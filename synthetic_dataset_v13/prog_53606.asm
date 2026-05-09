; DESCRIPTION: Composite: Places a black dot at position (279, 35) then Places a yellow line segment connecting (97, 160) to (46, 175) then Draws a yellow rectangle at (65, 155) with width 73 and height 28.
; PLAN: r0=279(x), r1=35(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=97(x1), r6=160(y1), r7=46(x2), r8=175(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=65(x), r11=155(y), r12=73(width), r13=28(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 35
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 97
LDI r6, 160
LDI r7, 46
LDI r8, 175
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 65
LDI r11, 155
LDI r12, 73
LDI r13, 28
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
