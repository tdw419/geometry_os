; DESCRIPTION: Composite: Places a red circle of radius 20 at center (54, 215) then Sets a single purple pixel at (408, 253) then Creates a red rectangular region at (353, 21) spanning 45 by 14 pixels.
; PLAN: r0=54(x), r1=215(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=408(x), r6=253(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=353(x), r11=21(y), r12=45(width), r13=14(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 54
LDI r1, 215
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 408
LDI r6, 253
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 353
LDI r11, 21
LDI r12, 45
LDI r13, 14
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
