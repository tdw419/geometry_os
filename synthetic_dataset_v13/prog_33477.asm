; DESCRIPTION: Composite: Sets a single yellow pixel at (152, 252) then Creates a white rectangular region at (30, 72) spanning 12 by 61 pixels then Places a magenta circle of radius 78 at center (353, 78).
; PLAN: r0=152(x), r1=252(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=30(x), r6=72(y), r7=12(width), r8=61(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=353(x), r11=78(y), r12=78(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 152
LDI r1, 252
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 30
LDI r6, 72
LDI r7, 12
LDI r8, 61
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 78
LDI r12, 78
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
