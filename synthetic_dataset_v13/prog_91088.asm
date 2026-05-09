; DESCRIPTION: Composite: Renders a yellow disk with center (249, 84) and radius 57 then Places a red dot at position (310, 15) then Places a blue 19x62 rectangle at position (375, 112).
; PLAN: r0=249(x), r1=84(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=310(x), r6=15(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=375(x), r11=112(y), r12=19(width), r13=62(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 84
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 310
LDI r6, 15
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 375
LDI r11, 112
LDI r12, 19
LDI r13, 62
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
