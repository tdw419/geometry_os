; DESCRIPTION: Composite: Draws a blue rectangle at (250, 11) with width 19 and height 82 then Sets a single cyan pixel at (466, 216) then Renders a purple disk with center (128, 106) and radius 43.
; PLAN: r0=250(x), r1=11(y), r2=19(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=466(x), r6=216(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=128(x), r11=106(y), r12=43(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 250
LDI r1, 11
LDI r2, 19
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 216
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 128
LDI r11, 106
LDI r12, 43
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
