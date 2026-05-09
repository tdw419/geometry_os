; DESCRIPTION: Composite: Creates a red rectangular region at (71, 133) spanning 97 by 71 pixels then Places a cyan dot at position (268, 195).
; PLAN: r0=71(x), r1=133(y), r2=97(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=268(x), r6=195(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 71
LDI r1, 133
LDI r2, 97
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 195
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
