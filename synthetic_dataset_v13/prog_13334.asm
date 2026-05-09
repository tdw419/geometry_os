; DESCRIPTION: Composite: Sets a single orange pixel at (356, 229) then Places a purple circle of radius 70 at center (381, 176) then Renders a green box of size 61x88 starting at (65, 110).
; PLAN: r0=356(x), r1=229(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=381(x), r6=176(y), r7=70(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=65(x), r11=110(y), r12=61(width), r13=88(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 229
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 381
LDI r6, 176
LDI r7, 70
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 65
LDI r11, 110
LDI r12, 61
LDI r13, 88
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
