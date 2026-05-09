; DESCRIPTION: Composite: Places a black dot at position (458, 218) then Renders a cyan box of size 35x115 starting at (346, 118) then Draws a red circle centered at (299, 175) with radius 72.
; PLAN: r0=458(x), r1=218(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=346(x), r6=118(y), r7=35(width), r8=115(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=299(x), r11=175(y), r12=72(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 458
LDI r1, 218
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 346
LDI r6, 118
LDI r7, 35
LDI r8, 115
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 175
LDI r12, 72
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
