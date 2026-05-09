; DESCRIPTION: Composite: Sets a single purple pixel at (198, 82) then Creates a magenta rectangular region at (378, 139) spanning 54 by 53 pixels then Creates a blue circular shape at (363, 114) with radius 78.
; PLAN: r0=198(x), r1=82(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=378(x), r6=139(y), r7=54(width), r8=53(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=363(x), r11=114(y), r12=78(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 198
LDI r1, 82
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 378
LDI r6, 139
LDI r7, 54
LDI r8, 53
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 363
LDI r11, 114
LDI r12, 78
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
