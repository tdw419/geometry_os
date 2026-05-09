; DESCRIPTION: Composite: Draws a green rectangle at (423, 124) with width 17 and height 28 then Renders a yellow line between points (230, 38) and (108, 18) then Sets a single blue pixel at (49, 172).
; PLAN: r0=423(x), r1=124(y), r2=17(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x1), r6=38(y1), r7=108(x2), r8=18(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=49(x), r11=172(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 423
LDI r1, 124
LDI r2, 17
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 38
LDI r7, 108
LDI r8, 18
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 49
LDI r11, 172
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
