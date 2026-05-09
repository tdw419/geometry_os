; DESCRIPTION: Composite: Places a orange dot at position (130, 232) then Renders a black box of size 71x114 starting at (418, 63) then Creates a cyan circular shape at (453, 185) with radius 45.
; PLAN: r0=130(x), r1=232(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=418(x), r6=63(y), r7=71(width), r8=114(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=453(x), r11=185(y), r12=45(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 130
LDI r1, 232
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 418
LDI r6, 63
LDI r7, 71
LDI r8, 114
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 453
LDI r11, 185
LDI r12, 45
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
