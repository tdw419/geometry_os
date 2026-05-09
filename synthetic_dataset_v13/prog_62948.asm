; DESCRIPTION: Composite: Sets a single green pixel at (143, 124) then Draws a yellow rectangle at (1, 94) with width 26 and height 54 then Draws a orange circle centered at (322, 207) with radius 28.
; PLAN: r0=143(x), r1=124(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=1(x), r6=94(y), r7=26(width), r8=54(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=322(x), r11=207(y), r12=28(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 143
LDI r1, 124
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 1
LDI r6, 94
LDI r7, 26
LDI r8, 54
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 322
LDI r11, 207
LDI r12, 28
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
