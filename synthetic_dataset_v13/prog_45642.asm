; DESCRIPTION: Composite: Places a white dot at position (102, 104) then Places a cyan circle of radius 16 at center (490, 216) then Creates a blue rectangular region at (342, 66) spanning 94 by 84 pixels.
; PLAN: r0=102(x), r1=104(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=490(x), r6=216(y), r7=16(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=342(x), r11=66(y), r12=94(width), r13=84(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 104
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 490
LDI r6, 216
LDI r7, 16
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 342
LDI r11, 66
LDI r12, 94
LDI r13, 84
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
