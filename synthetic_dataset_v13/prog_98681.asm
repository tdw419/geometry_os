; DESCRIPTION: Composite: Creates a red rectangular region at (414, 182) spanning 19 by 20 pixels then Places a green dot at position (181, 145).
; PLAN: r0=414(x), r1=182(y), r2=19(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=181(x), r6=145(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 414
LDI r1, 182
LDI r2, 19
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 145
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
