; DESCRIPTION: Composite: Renders a red disk with center (473, 34) and radius 32 then Places a black dot at position (169, 84) then Creates a black rectangular region at (259, 207) spanning 45 by 29 pixels.
; PLAN: r0=473(x), r1=34(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=169(x), r6=84(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=259(x), r11=207(y), r12=45(width), r13=29(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 473
LDI r1, 34
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 169
LDI r6, 84
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 259
LDI r11, 207
LDI r12, 45
LDI r13, 29
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
