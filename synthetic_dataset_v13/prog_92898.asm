; DESCRIPTION: Composite: Sets a single blue pixel at (191, 95) then Creates a orange rectangular region at (300, 133) spanning 59 by 45 pixels then Places a yellow circle of radius 49 at center (226, 141).
; PLAN: r0=191(x), r1=95(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=133(y), r7=59(width), r8=45(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=226(x), r11=141(y), r12=49(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 191
LDI r1, 95
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 300
LDI r6, 133
LDI r7, 59
LDI r8, 45
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 226
LDI r11, 141
LDI r12, 49
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
