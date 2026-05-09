; DESCRIPTION: Composite: Places a white 62x80 rectangle at position (54, 156) then Places a cyan dot at position (39, 141) then Draws a orange circle centered at (90, 181) with radius 46.
; PLAN: r0=54(x), r1=156(y), r2=62(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=39(x), r6=141(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=90(x), r11=181(y), r12=46(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 54
LDI r1, 156
LDI r2, 62
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 141
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 90
LDI r11, 181
LDI r12, 46
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
