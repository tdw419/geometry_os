; DESCRIPTION: Composite: Sets a single white pixel at (131, 119) then Creates a cyan rectangular region at (466, 151) spanning 14 by 42 pixels then Draws a white circle centered at (450, 87) with radius 61.
; PLAN: r0=131(x), r1=119(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=466(x), r6=151(y), r7=14(width), r8=42(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=450(x), r11=87(y), r12=61(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 131
LDI r1, 119
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 466
LDI r6, 151
LDI r7, 14
LDI r8, 42
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 450
LDI r11, 87
LDI r12, 61
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
