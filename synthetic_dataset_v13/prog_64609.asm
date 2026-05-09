; DESCRIPTION: Composite: Places a red circle of radius 33 at center (233, 167) then Creates a white rectangular region at (276, 7) spanning 82 by 57 pixels then Sets a single purple pixel at (70, 53).
; PLAN: r0=233(x), r1=167(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=276(x), r6=7(y), r7=82(width), r8=57(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=70(x), r11=53(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 233
LDI r1, 167
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 276
LDI r6, 7
LDI r7, 82
LDI r8, 57
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 70
LDI r11, 53
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
