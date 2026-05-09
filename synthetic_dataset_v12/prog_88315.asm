; DESCRIPTION: Composite: Creates a green rectangular region at (18, 162) spanning 19 by 77 pixels then Places a yellow dot at position (392, 72) then Places a white circle of radius 37 at center (414, 136).
; PLAN: r0=18(x), r1=162(y), r2=19(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=392(x), r6=72(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=414(x), r11=136(y), r12=37(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 18
LDI r1, 162
LDI r2, 19
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 72
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 414
LDI r11, 136
LDI r12, 37
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
