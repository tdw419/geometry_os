; DESCRIPTION: Composite: Sets a single yellow pixel at (229, 14) then Creates a cyan rectangular region at (337, 122) spanning 12 by 59 pixels then Creates a purple circular shape at (101, 191) with radius 64.
; PLAN: r0=229(x), r1=14(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=337(x), r6=122(y), r7=12(width), r8=59(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=101(x), r11=191(y), r12=64(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 229
LDI r1, 14
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 337
LDI r6, 122
LDI r7, 12
LDI r8, 59
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 101
LDI r11, 191
LDI r12, 64
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
