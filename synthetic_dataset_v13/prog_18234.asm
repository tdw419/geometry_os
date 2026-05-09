; DESCRIPTION: Composite: Places a red dot at position (275, 176) then Draws a white circle centered at (230, 149) with radius 34 then Draws a blue rectangle at (319, 99) with width 71 and height 70.
; PLAN: r0=275(x), r1=176(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=230(x), r6=149(y), r7=34(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=319(x), r11=99(y), r12=71(width), r13=70(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 176
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 230
LDI r6, 149
LDI r7, 34
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 319
LDI r11, 99
LDI r12, 71
LDI r13, 70
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
