; DESCRIPTION: Composite: Creates a blue circular shape at (248, 113) with radius 46 then Sets a single cyan pixel at (334, 51) then Places a yellow 85x91 rectangle at position (108, 58).
; PLAN: r0=248(x), r1=113(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x), r6=51(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=108(x), r11=58(y), r12=85(width), r13=91(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 113
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 51
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 108
LDI r11, 58
LDI r12, 85
LDI r13, 91
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
