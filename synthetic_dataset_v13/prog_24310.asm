; DESCRIPTION: Composite: Places a purple 56x31 rectangle at position (58, 32) then Places a blue dot at position (69, 70) then Renders a magenta disk with center (274, 156) and radius 23.
; PLAN: r0=58(x), r1=32(y), r2=56(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x), r6=70(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=274(x), r11=156(y), r12=23(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 58
LDI r1, 32
LDI r2, 56
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 70
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 274
LDI r11, 156
LDI r12, 23
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
