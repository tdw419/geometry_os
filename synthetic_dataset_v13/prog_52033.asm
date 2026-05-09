; DESCRIPTION: Composite: Places a cyan dot at position (423, 158) then Places a white circle of radius 10 at center (288, 144) then Creates a black rectangular region at (95, 29) spanning 103 by 71 pixels.
; PLAN: r0=423(x), r1=158(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=288(x), r6=144(y), r7=10(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=95(x), r11=29(y), r12=103(width), r13=71(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 158
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 288
LDI r6, 144
LDI r7, 10
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 95
LDI r11, 29
LDI r12, 103
LDI r13, 71
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
