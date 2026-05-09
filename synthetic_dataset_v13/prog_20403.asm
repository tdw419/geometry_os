; DESCRIPTION: Composite: Creates a cyan rectangular region at (464, 177) spanning 18 by 58 pixels then Sets a single white pixel at (119, 245) then Creates a orange circular shape at (445, 137) with radius 58.
; PLAN: r0=464(x), r1=177(y), r2=18(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=119(x), r6=245(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=445(x), r11=137(y), r12=58(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 464
LDI r1, 177
LDI r2, 18
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 245
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 445
LDI r11, 137
LDI r12, 58
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
