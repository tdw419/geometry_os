; DESCRIPTION: Composite: Creates a green rectangular region at (344, 108) spanning 30 by 106 pixels then Places a red dot at position (354, 179).
; PLAN: r0=344(x), r1=108(y), r2=30(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=354(x), r6=179(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 344
LDI r1, 108
LDI r2, 30
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 179
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
