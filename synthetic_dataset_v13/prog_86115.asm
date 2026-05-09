; DESCRIPTION: Composite: Creates a red rectangular region at (310, 26) spanning 98 by 113 pixels then Creates a red circular shape at (418, 30) with radius 23 then Places a white dot at position (381, 21).
; PLAN: r0=310(x), r1=26(y), r2=98(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=30(y), r7=23(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=381(x), r11=21(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 310
LDI r1, 26
LDI r2, 98
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 30
LDI r7, 23
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 381
LDI r11, 21
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
