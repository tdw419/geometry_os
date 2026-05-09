; DESCRIPTION: Composite: Places a orange 11x102 rectangle at position (409, 72) then Draws a yellow circle centered at (132, 84) with radius 71 then Sets a single white pixel at (420, 54).
; PLAN: r0=409(x), r1=72(y), r2=11(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x), r6=84(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=420(x), r11=54(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 409
LDI r1, 72
LDI r2, 11
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 84
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 420
LDI r11, 54
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
