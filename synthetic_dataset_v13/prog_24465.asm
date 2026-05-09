; DESCRIPTION: Composite: Creates a red rectangular region at (166, 21) spanning 15 by 111 pixels then Sets a single yellow pixel at (305, 73) then Creates a orange circular shape at (397, 96) with radius 20.
; PLAN: r0=166(x), r1=21(y), r2=15(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=305(x), r6=73(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=397(x), r11=96(y), r12=20(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 166
LDI r1, 21
LDI r2, 15
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 73
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 397
LDI r11, 96
LDI r12, 20
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
