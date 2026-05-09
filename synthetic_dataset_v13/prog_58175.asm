; DESCRIPTION: Composite: Creates a purple rectangular region at (367, 167) spanning 52 by 82 pixels then Places a magenta dot at position (223, 114).
; PLAN: r0=367(x), r1=167(y), r2=52(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=223(x), r6=114(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 367
LDI r1, 167
LDI r2, 52
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 114
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
