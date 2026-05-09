; DESCRIPTION: Composite: Creates a blue rectangular region at (258, 64) spanning 31 by 47 pixels then Places a cyan dot at position (380, 127).
; PLAN: r0=258(x), r1=64(y), r2=31(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=380(x), r6=127(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 258
LDI r1, 64
LDI r2, 31
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 127
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
