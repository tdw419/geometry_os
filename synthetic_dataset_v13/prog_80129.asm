; DESCRIPTION: Composite: Places a black dot at position (475, 195) then Creates a green rectangular region at (431, 19) spanning 44 by 92 pixels then Creates a black circular shape at (277, 208) with radius 13.
; PLAN: r0=475(x), r1=195(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=431(x), r6=19(y), r7=44(width), r8=92(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=277(x), r11=208(y), r12=13(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 475
LDI r1, 195
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 431
LDI r6, 19
LDI r7, 44
LDI r8, 92
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 277
LDI r11, 208
LDI r12, 13
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
