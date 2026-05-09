; DESCRIPTION: Composite: Draws a green rectangle at (150, 36) with width 12 and height 92 then Sets a single magenta pixel at (105, 8) then Places a purple circle of radius 19 at center (470, 87).
; PLAN: r0=150(x), r1=36(y), r2=12(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=105(x), r6=8(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=470(x), r11=87(y), r12=19(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 150
LDI r1, 36
LDI r2, 12
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 8
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 470
LDI r11, 87
LDI r12, 19
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
