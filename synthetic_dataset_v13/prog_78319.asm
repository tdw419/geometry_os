; DESCRIPTION: Composite: Places a green circle of radius 15 at center (343, 16) then Creates a green rectangular region at (32, 143) spanning 68 by 69 pixels then Sets a single white pixel at (445, 68).
; PLAN: r0=343(x), r1=16(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=32(x), r6=143(y), r7=68(width), r8=69(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=445(x), r11=68(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 343
LDI r1, 16
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 32
LDI r6, 143
LDI r7, 68
LDI r8, 69
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 445
LDI r11, 68
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
