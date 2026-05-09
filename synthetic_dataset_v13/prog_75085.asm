; DESCRIPTION: Composite: Places a blue circle of radius 40 at center (59, 114) then Places a green dot at position (77, 119) then Places a blue 99x105 rectangle at position (333, 122).
; PLAN: r0=59(x), r1=114(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=77(x), r6=119(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=333(x), r11=122(y), r12=99(width), r13=105(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 114
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 77
LDI r6, 119
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 333
LDI r11, 122
LDI r12, 99
LDI r13, 105
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
