; DESCRIPTION: Composite: Places a orange 39x86 rectangle at position (327, 152) then Places a cyan line segment connecting (385, 219) to (424, 3) then Creates a black circular shape at (289, 113) with radius 43.
; PLAN: r0=327(x), r1=152(y), r2=39(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=385(x1), r6=219(y1), r7=424(x2), r8=3(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=289(x), r11=113(y), r12=43(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 327
LDI r1, 152
LDI r2, 39
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 219
LDI r7, 424
LDI r8, 3
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 289
LDI r11, 113
LDI r12, 43
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
