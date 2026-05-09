; DESCRIPTION: Composite: Creates a red rectangular region at (234, 197) spanning 104 by 56 pixels then Sets a single blue pixel at (369, 98) then Creates a cyan circular shape at (218, 132) with radius 15.
; PLAN: r0=234(x), r1=197(y), r2=104(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=369(x), r6=98(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=218(x), r11=132(y), r12=15(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 234
LDI r1, 197
LDI r2, 104
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 98
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 218
LDI r11, 132
LDI r12, 15
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
