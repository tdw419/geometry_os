; DESCRIPTION: Composite: Draws a orange rectangle at (409, 23) with width 99 and height 27 then Draws a orange circle centered at (281, 135) with radius 33 then Places a red dot at position (222, 110).
; PLAN: r0=409(x), r1=23(y), r2=99(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x), r6=135(y), r7=33(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=222(x), r11=110(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 409
LDI r1, 23
LDI r2, 99
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 135
LDI r7, 33
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 222
LDI r11, 110
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
