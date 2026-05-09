; DESCRIPTION: Composite: Creates a orange rectangular region at (116, 146) spanning 39 by 73 pixels then Places a orange dot at position (160, 115).
; PLAN: r0=116(x), r1=146(y), r2=39(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=160(x), r6=115(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 116
LDI r1, 146
LDI r2, 39
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 115
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
