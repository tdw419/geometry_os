; DESCRIPTION: Composite: Sets a single cyan pixel at (507, 142) then Places a yellow circle of radius 31 at center (357, 146) then Creates a black rectangular region at (393, 155) spanning 39 by 63 pixels.
; PLAN: r0=507(x), r1=142(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=357(x), r6=146(y), r7=31(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=393(x), r11=155(y), r12=39(width), r13=63(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 507
LDI r1, 142
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 357
LDI r6, 146
LDI r7, 31
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 393
LDI r11, 155
LDI r12, 39
LDI r13, 63
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
