; DESCRIPTION: Composite: Draws a yellow circle centered at (447, 77) with radius 55 then Places a yellow 34x75 rectangle at position (397, 159) then Sets a single green pixel at (198, 84).
; PLAN: r0=447(x), r1=77(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=397(x), r6=159(y), r7=34(width), r8=75(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=198(x), r11=84(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 447
LDI r1, 77
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 397
LDI r6, 159
LDI r7, 34
LDI r8, 75
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 84
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
