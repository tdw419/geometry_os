; DESCRIPTION: Composite: Draws a orange circle centered at (387, 66) with radius 57 then Draws a orange rectangle at (431, 29) with width 77 and height 32 then Places a red dot at position (143, 0).
; PLAN: r0=387(x), r1=66(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x), r6=29(y), r7=77(width), r8=32(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=143(x), r11=0(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 387
LDI r1, 66
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 29
LDI r7, 77
LDI r8, 32
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 143
LDI r11, 0
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
