; DESCRIPTION: Composite: Creates a yellow rectangular region at (116, 31) spanning 86 by 37 pixels then Creates a red circular shape at (198, 187) with radius 43 then Places a red dot at position (137, 86).
; PLAN: r0=116(x), r1=31(y), r2=86(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x), r6=187(y), r7=43(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=137(x), r11=86(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 116
LDI r1, 31
LDI r2, 86
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 187
LDI r7, 43
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 137
LDI r11, 86
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
