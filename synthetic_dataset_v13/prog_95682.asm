; DESCRIPTION: Composite: Creates a orange rectangular region at (182, 37) spanning 114 by 47 pixels then Sets a single purple pixel at (137, 46).
; PLAN: r0=182(x), r1=37(y), r2=114(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x), r6=46(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 182
LDI r1, 37
LDI r2, 114
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 46
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
