; DESCRIPTION: Composite: Renders a purple box of size 88x86 starting at (242, 0) then Places a green dot at position (364, 83) then Creates a black circular shape at (366, 60) with radius 45.
; PLAN: r0=242(x), r1=0(y), r2=88(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=364(x), r6=83(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=366(x), r11=60(y), r12=45(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 242
LDI r1, 0
LDI r2, 88
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 83
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 366
LDI r11, 60
LDI r12, 45
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
