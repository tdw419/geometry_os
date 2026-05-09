; DESCRIPTION: Composite: Places a green dot at position (504, 132) then Places a cyan 13x104 rectangle at position (223, 16) then Draws a purple circle centered at (59, 219) with radius 17.
; PLAN: r0=504(x), r1=132(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=16(y), r7=13(width), r8=104(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=59(x), r11=219(y), r12=17(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 504
LDI r1, 132
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 223
LDI r6, 16
LDI r7, 13
LDI r8, 104
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 219
LDI r12, 17
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
