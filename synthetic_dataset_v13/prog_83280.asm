; DESCRIPTION: Composite: Sets a single orange pixel at (431, 56) then Draws a white circle centered at (94, 142) with radius 29 then Places a cyan 89x75 rectangle at position (2, 9).
; PLAN: r0=431(x), r1=56(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=94(x), r6=142(y), r7=29(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=2(x), r11=9(y), r12=89(width), r13=75(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 431
LDI r1, 56
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 94
LDI r6, 142
LDI r7, 29
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 2
LDI r11, 9
LDI r12, 89
LDI r13, 75
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
