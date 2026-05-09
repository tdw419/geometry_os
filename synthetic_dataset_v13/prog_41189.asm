; DESCRIPTION: Composite: Draws a purple line from (98, 57) to (56, 18) then Places a cyan circle of radius 44 at center (291, 105) then Draws a yellow rectangle at (358, 17) with width 55 and height 84.
; PLAN: r0=98(x1), r1=57(y1), r2=56(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=105(y), r7=44(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=358(x), r11=17(y), r12=55(width), r13=84(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 98
LDI r1, 57
LDI r2, 56
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 105
LDI r7, 44
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 358
LDI r11, 17
LDI r12, 55
LDI r13, 84
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
