; DESCRIPTION: Composite: Places a magenta circle of radius 80 at center (239, 115) then Places a green dot at position (273, 87) then Creates a blue rectangular region at (153, 136) spanning 22 by 36 pixels.
; PLAN: r0=239(x), r1=115(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=273(x), r6=87(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=153(x), r11=136(y), r12=22(width), r13=36(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 239
LDI r1, 115
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 273
LDI r6, 87
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 153
LDI r11, 136
LDI r12, 22
LDI r13, 36
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
