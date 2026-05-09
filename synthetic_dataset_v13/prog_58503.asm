; DESCRIPTION: Composite: Draws a blue rectangle at (53, 3) with width 56 and height 21 then Places a yellow dot at position (250, 126) then Renders a green disk with center (73, 87) and radius 63.
; PLAN: r0=53(x), r1=3(y), r2=56(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=250(x), r6=126(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=73(x), r11=87(y), r12=63(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 53
LDI r1, 3
LDI r2, 56
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 126
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 73
LDI r11, 87
LDI r12, 63
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
