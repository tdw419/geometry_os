; DESCRIPTION: Composite: Creates a orange rectangular region at (307, 65) spanning 82 by 61 pixels then Sets a single purple pixel at (352, 223) then Creates a red circular shape at (165, 182) with radius 35.
; PLAN: r0=307(x), r1=65(y), r2=82(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=352(x), r6=223(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=165(x), r11=182(y), r12=35(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 307
LDI r1, 65
LDI r2, 82
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 223
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 165
LDI r11, 182
LDI r12, 35
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
