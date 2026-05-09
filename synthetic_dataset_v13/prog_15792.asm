; DESCRIPTION: Composite: Places a purple circle of radius 33 at center (55, 220) then Places a magenta dot at position (86, 207) then Creates a green rectangular region at (75, 2) spanning 68 by 17 pixels.
; PLAN: r0=55(x), r1=220(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=86(x), r6=207(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=75(x), r11=2(y), r12=68(width), r13=17(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 55
LDI r1, 220
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 86
LDI r6, 207
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 75
LDI r11, 2
LDI r12, 68
LDI r13, 17
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
