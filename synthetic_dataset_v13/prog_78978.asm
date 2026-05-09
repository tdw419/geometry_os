; DESCRIPTION: Composite: Creates a orange rectangular region at (144, 159) spanning 43 by 28 pixels then Sets a single white pixel at (303, 68).
; PLAN: r0=144(x), r1=159(y), r2=43(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=303(x), r6=68(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 144
LDI r1, 159
LDI r2, 43
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 68
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
