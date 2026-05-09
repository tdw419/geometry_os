; DESCRIPTION: Composite: Sets a single blue pixel at (359, 234) then Creates a yellow rectangular region at (46, 72) spanning 109 by 54 pixels then Places a black circle of radius 20 at center (353, 72).
; PLAN: r0=359(x), r1=234(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=46(x), r6=72(y), r7=109(width), r8=54(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=353(x), r11=72(y), r12=20(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 359
LDI r1, 234
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 46
LDI r6, 72
LDI r7, 109
LDI r8, 54
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 72
LDI r12, 20
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
