; DESCRIPTION: Composite: Sets a single blue pixel at (432, 191) then Renders a yellow disk with center (131, 188) and radius 46 then Renders a black box of size 23x105 starting at (55, 125).
; PLAN: r0=432(x), r1=191(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=131(x), r6=188(y), r7=46(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=55(x), r11=125(y), r12=23(width), r13=105(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 191
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 131
LDI r6, 188
LDI r7, 46
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 55
LDI r11, 125
LDI r12, 23
LDI r13, 105
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
