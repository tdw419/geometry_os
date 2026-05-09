; DESCRIPTION: Composite: Draws a purple rectangle at (69, 27) with width 28 and height 88 then Places a red circle of radius 31 at center (328, 119) then Sets a single cyan pixel at (290, 121).
; PLAN: r0=69(x), r1=27(y), r2=28(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=328(x), r6=119(y), r7=31(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=290(x), r11=121(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 69
LDI r1, 27
LDI r2, 28
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 119
LDI r7, 31
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 290
LDI r11, 121
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
