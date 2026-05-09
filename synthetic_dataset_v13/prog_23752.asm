; DESCRIPTION: Composite: Creates a red rectangular region at (133, 7) spanning 11 by 79 pixels then Places a red dot at position (33, 31).
; PLAN: r0=133(x), r1=7(y), r2=11(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=33(x), r6=31(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 133
LDI r1, 7
LDI r2, 11
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 31
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
