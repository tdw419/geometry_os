; DESCRIPTION: Composite: Places a cyan dot at position (510, 125) then Creates a yellow circular shape at (209, 91) with radius 62 then Draws a white rectangle at (271, 128) with width 101 and height 28.
; PLAN: r0=510(x), r1=125(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=209(x), r6=91(y), r7=62(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=271(x), r11=128(y), r12=101(width), r13=28(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 510
LDI r1, 125
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 209
LDI r6, 91
LDI r7, 62
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 271
LDI r11, 128
LDI r12, 101
LDI r13, 28
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
