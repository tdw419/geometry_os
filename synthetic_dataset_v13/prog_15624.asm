; DESCRIPTION: Composite: Creates a red rectangular region at (376, 1) spanning 16 by 19 pixels then Sets a single white pixel at (249, 98) then Draws a blue circle centered at (146, 152) with radius 55.
; PLAN: r0=376(x), r1=1(y), r2=16(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=249(x), r6=98(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=146(x), r11=152(y), r12=55(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 376
LDI r1, 1
LDI r2, 16
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 98
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 146
LDI r11, 152
LDI r12, 55
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
