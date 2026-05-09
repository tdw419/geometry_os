; DESCRIPTION: Composite: Creates a purple circular shape at (160, 83) with radius 75 then Sets a single orange pixel at (498, 185) then Renders a blue box of size 98x26 starting at (245, 100).
; PLAN: r0=160(x), r1=83(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=498(x), r6=185(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=245(x), r11=100(y), r12=98(width), r13=26(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 160
LDI r1, 83
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 498
LDI r6, 185
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 245
LDI r11, 100
LDI r12, 98
LDI r13, 26
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
