; DESCRIPTION: Composite: Sets a single blue pixel at (260, 254) then Creates a red rectangular region at (4, 22) spanning 25 by 43 pixels then Places a black circle of radius 49 at center (412, 96).
; PLAN: r0=260(x), r1=254(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=4(x), r6=22(y), r7=25(width), r8=43(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=412(x), r11=96(y), r12=49(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 260
LDI r1, 254
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 4
LDI r6, 22
LDI r7, 25
LDI r8, 43
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 412
LDI r11, 96
LDI r12, 49
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
