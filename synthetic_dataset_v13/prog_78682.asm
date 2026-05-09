; DESCRIPTION: Composite: Places a orange circle of radius 45 at center (314, 118) then Sets a single cyan pixel at (265, 236) then Renders a purple box of size 14x32 starting at (22, 90).
; PLAN: r0=314(x), r1=118(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=265(x), r6=236(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=22(x), r11=90(y), r12=14(width), r13=32(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 314
LDI r1, 118
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 265
LDI r6, 236
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 22
LDI r11, 90
LDI r12, 14
LDI r13, 32
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
