; DESCRIPTION: Composite: Creates a black rectangular region at (300, 90) spanning 20 by 83 pixels then Sets a single white pixel at (437, 26) then Draws a white circle centered at (105, 159) with radius 39.
; PLAN: r0=300(x), r1=90(y), r2=20(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=437(x), r6=26(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=105(x), r11=159(y), r12=39(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 300
LDI r1, 90
LDI r2, 20
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 26
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 105
LDI r11, 159
LDI r12, 39
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
