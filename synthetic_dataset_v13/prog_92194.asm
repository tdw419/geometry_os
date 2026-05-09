; DESCRIPTION: Composite: Places a black circle of radius 19 at center (277, 24) then Places a red dot at position (224, 80) then Draws a black rectangle at (254, 84) with width 12 and height 82.
; PLAN: r0=277(x), r1=24(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=224(x), r6=80(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=254(x), r11=84(y), r12=12(width), r13=82(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 24
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 224
LDI r6, 80
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 254
LDI r11, 84
LDI r12, 12
LDI r13, 82
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
