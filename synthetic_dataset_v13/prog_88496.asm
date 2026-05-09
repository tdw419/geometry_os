; DESCRIPTION: Composite: Creates a black rectangular region at (238, 57) spanning 12 by 32 pixels then Sets a single red pixel at (234, 14) then Draws a cyan circle centered at (385, 108) with radius 18.
; PLAN: r0=238(x), r1=57(y), r2=12(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x), r6=14(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=385(x), r11=108(y), r12=18(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 238
LDI r1, 57
LDI r2, 12
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 14
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 385
LDI r11, 108
LDI r12, 18
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
