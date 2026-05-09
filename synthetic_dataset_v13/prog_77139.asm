; DESCRIPTION: Composite: Draws a cyan rectangle at (99, 6) with width 108 and height 58 then Places a purple circle of radius 67 at center (225, 153) then Sets a single yellow pixel at (78, 173).
; PLAN: r0=99(x), r1=6(y), r2=108(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=225(x), r6=153(y), r7=67(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=78(x), r11=173(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 99
LDI r1, 6
LDI r2, 108
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 153
LDI r7, 67
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 78
LDI r11, 173
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
