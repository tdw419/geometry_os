; DESCRIPTION: Composite: Creates a green rectangular region at (171, 120) spanning 21 by 12 pixels then Creates a red circular shape at (137, 57) with radius 31 then Places a white dot at position (306, 155).
; PLAN: r0=171(x), r1=120(y), r2=21(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x), r6=57(y), r7=31(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=306(x), r11=155(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 171
LDI r1, 120
LDI r2, 21
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 57
LDI r7, 31
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 306
LDI r11, 155
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
