; DESCRIPTION: Composite: Creates a black circular shape at (280, 134) with radius 80 then Places a blue dot at position (153, 12) then Renders a black box of size 80x65 starting at (319, 181).
; PLAN: r0=280(x), r1=134(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=153(x), r6=12(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=319(x), r11=181(y), r12=80(width), r13=65(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 134
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 153
LDI r6, 12
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 319
LDI r11, 181
LDI r12, 80
LDI r13, 65
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
