; DESCRIPTION: Composite: Places a black dot at position (474, 239) then Creates a purple circular shape at (302, 47) with radius 22 then Creates a black rectangular region at (64, 60) spanning 54 by 103 pixels.
; PLAN: r0=474(x), r1=239(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=302(x), r6=47(y), r7=22(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=64(x), r11=60(y), r12=54(width), r13=103(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 474
LDI r1, 239
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 302
LDI r6, 47
LDI r7, 22
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 64
LDI r11, 60
LDI r12, 54
LDI r13, 103
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
