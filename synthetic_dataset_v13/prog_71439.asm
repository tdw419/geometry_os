; DESCRIPTION: Composite: Renders a magenta disk with center (415, 87) and radius 17 then Places a purple dot at position (435, 249) then Draws a blue rectangle at (145, 169) with width 115 and height 10.
; PLAN: r0=415(x), r1=87(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x), r6=249(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=145(x), r11=169(y), r12=115(width), r13=10(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 87
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 249
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 145
LDI r11, 169
LDI r12, 115
LDI r13, 10
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
