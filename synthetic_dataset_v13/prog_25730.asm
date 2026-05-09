; DESCRIPTION: Composite: Places a red dot at position (85, 94) then Creates a red circular shape at (391, 107) with radius 70 then Creates a cyan rectangular region at (185, 35) spanning 77 by 53 pixels.
; PLAN: r0=85(x), r1=94(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=391(x), r6=107(y), r7=70(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=185(x), r11=35(y), r12=77(width), r13=53(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 94
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 391
LDI r6, 107
LDI r7, 70
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 185
LDI r11, 35
LDI r12, 77
LDI r13, 53
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
