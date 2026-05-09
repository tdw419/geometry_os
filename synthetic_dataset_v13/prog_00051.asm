; DESCRIPTION: Composite: Renders a black box of size 103x10 starting at (128, 149) then Places a purple dot at position (107, 193) then Places a orange circle of radius 36 at center (388, 172).
; PLAN: r0=128(x), r1=149(y), r2=103(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=107(x), r6=193(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=388(x), r11=172(y), r12=36(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 128
LDI r1, 149
LDI r2, 103
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 193
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 388
LDI r11, 172
LDI r12, 36
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
