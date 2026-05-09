; DESCRIPTION: Composite: Renders a white disk with center (374, 126) and radius 23 then Places a magenta dot at position (44, 180) then Draws a blue rectangle at (73, 59) with width 118 and height 13.
; PLAN: r0=374(x), r1=126(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x), r6=180(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=73(x), r11=59(y), r12=118(width), r13=13(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 374
LDI r1, 126
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 180
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 73
LDI r11, 59
LDI r12, 118
LDI r13, 13
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
