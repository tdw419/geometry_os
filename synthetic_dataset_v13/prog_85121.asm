; DESCRIPTION: Composite: Sets a single purple pixel at (383, 3) then Draws a red circle centered at (413, 90) with radius 72 then Creates a cyan rectangular region at (252, 18) spanning 106 by 30 pixels.
; PLAN: r0=383(x), r1=3(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=413(x), r6=90(y), r7=72(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=252(x), r11=18(y), r12=106(width), r13=30(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 3
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 413
LDI r6, 90
LDI r7, 72
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 252
LDI r11, 18
LDI r12, 106
LDI r13, 30
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
