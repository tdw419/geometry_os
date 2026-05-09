; DESCRIPTION: Composite: Places a purple 75x55 rectangle at position (103, 107) then Sets a single orange pixel at (384, 210) then Creates a yellow circular shape at (438, 116) with radius 35.
; PLAN: r0=103(x), r1=107(y), r2=75(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=384(x), r6=210(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=438(x), r11=116(y), r12=35(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 103
LDI r1, 107
LDI r2, 75
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 210
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 438
LDI r11, 116
LDI r12, 35
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
