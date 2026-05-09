; DESCRIPTION: Composite: Creates a green rectangular region at (212, 207) spanning 26 by 47 pixels then Sets a single black pixel at (412, 64) then Places a white circle of radius 27 at center (314, 227).
; PLAN: r0=212(x), r1=207(y), r2=26(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=412(x), r6=64(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=314(x), r11=227(y), r12=27(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 212
LDI r1, 207
LDI r2, 26
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 64
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 314
LDI r11, 227
LDI r12, 27
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
