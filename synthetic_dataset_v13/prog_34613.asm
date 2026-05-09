; DESCRIPTION: Composite: Creates a cyan circular shape at (177, 210) with radius 21 then Creates a green rectangular region at (225, 148) spanning 39 by 61 pixels then Places a orange dot at position (202, 87).
; PLAN: r0=177(x), r1=210(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x), r6=148(y), r7=39(width), r8=61(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=202(x), r11=87(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 177
LDI r1, 210
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 148
LDI r7, 39
LDI r8, 61
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 87
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
