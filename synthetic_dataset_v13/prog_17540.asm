; DESCRIPTION: Composite: Sets a single green pixel at (455, 32) then Draws a cyan circle centered at (173, 67) with radius 45 then Places a white line segment connecting (143, 212) to (232, 119).
; PLAN: r0=455(x), r1=32(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=173(x), r6=67(y), r7=45(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=143(x1), r11=212(y1), r12=232(x2), r13=119(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 455
LDI r1, 32
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 173
LDI r6, 67
LDI r7, 45
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 143
LDI r11, 212
LDI r12, 232
LDI r13, 119
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
