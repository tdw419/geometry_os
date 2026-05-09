; DESCRIPTION: Composite: Places a yellow dot at position (35, 230) then Creates a magenta circular shape at (106, 160) with radius 76 then Draws a cyan rectangle at (216, 109) with width 49 and height 53.
; PLAN: r0=35(x), r1=230(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=106(x), r6=160(y), r7=76(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=216(x), r11=109(y), r12=49(width), r13=53(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 35
LDI r1, 230
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 106
LDI r6, 160
LDI r7, 76
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 216
LDI r11, 109
LDI r12, 49
LDI r13, 53
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
