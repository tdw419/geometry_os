; DESCRIPTION: Composite: Creates a red rectangular region at (396, 57) spanning 87 by 68 pixels then Places a purple dot at position (134, 244).
; PLAN: r0=396(x), r1=57(y), r2=87(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=134(x), r6=244(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 396
LDI r1, 57
LDI r2, 87
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 244
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
