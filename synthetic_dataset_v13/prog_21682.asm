; DESCRIPTION: Composite: Sets a single yellow pixel at (171, 84) then Draws a cyan rectangle at (205, 43) with width 59 and height 14 then Places a purple circle of radius 23 at center (269, 48).
; PLAN: r0=171(x), r1=84(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=205(x), r6=43(y), r7=59(width), r8=14(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=269(x), r11=48(y), r12=23(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 171
LDI r1, 84
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 205
LDI r6, 43
LDI r7, 59
LDI r8, 14
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 48
LDI r12, 23
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
