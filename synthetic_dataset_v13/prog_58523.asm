; DESCRIPTION: Composite: Sets a single blue pixel at (505, 251) then Places a black line segment connecting (177, 76) to (451, 242) then Creates a orange rectangular region at (3, 1) spanning 105 by 111 pixels.
; PLAN: r0=505(x), r1=251(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=177(x1), r6=76(y1), r7=451(x2), r8=242(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=3(x), r11=1(y), r12=105(width), r13=111(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 505
LDI r1, 251
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 177
LDI r6, 76
LDI r7, 451
LDI r8, 242
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 3
LDI r11, 1
LDI r12, 105
LDI r13, 111
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
