; DESCRIPTION: Composite: Creates a magenta rectangular region at (374, 48) spanning 29 by 104 pixels then Sets a single orange pixel at (338, 173) then Places a purple circle of radius 71 at center (411, 81).
; PLAN: r0=374(x), r1=48(y), r2=29(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=338(x), r6=173(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=411(x), r11=81(y), r12=71(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 374
LDI r1, 48
LDI r2, 29
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 173
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 411
LDI r11, 81
LDI r12, 71
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
