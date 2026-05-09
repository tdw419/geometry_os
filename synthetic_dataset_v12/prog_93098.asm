; DESCRIPTION: Composite: Sets a single cyan pixel at (258, 212) then Creates a red rectangular region at (25, 224) spanning 46 by 29 pixels then Places a white circle of radius 48 at center (140, 170).
; PLAN: r0=258(x), r1=212(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=25(x), r6=224(y), r7=46(width), r8=29(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=140(x), r11=170(y), r12=48(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 258
LDI r1, 212
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 25
LDI r6, 224
LDI r7, 46
LDI r8, 29
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 140
LDI r11, 170
LDI r12, 48
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
