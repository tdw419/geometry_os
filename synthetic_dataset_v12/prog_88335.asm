; DESCRIPTION: Composite: Renders a blue box of size 39x119 starting at (256, 84) then Places a purple dot at position (191, 239) then Places a white line segment connecting (354, 29) to (35, 98).
; PLAN: r0=256(x), r1=84(y), r2=39(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x), r6=239(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=354(x1), r11=29(y1), r12=35(x2), r13=98(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 84
LDI r2, 39
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 239
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 354
LDI r11, 29
LDI r12, 35
LDI r13, 98
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
