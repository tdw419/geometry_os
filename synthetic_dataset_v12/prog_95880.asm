; DESCRIPTION: Composite: Creates a white circular shape at (45, 179) with radius 25 then Creates a black rectangular region at (171, 97) spanning 16 by 46 pixels then Sets a single yellow pixel at (397, 135).
; PLAN: r0=45(x), r1=179(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=171(x), r6=97(y), r7=16(width), r8=46(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=397(x), r11=135(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 45
LDI r1, 179
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 171
LDI r6, 97
LDI r7, 16
LDI r8, 46
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 397
LDI r11, 135
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
