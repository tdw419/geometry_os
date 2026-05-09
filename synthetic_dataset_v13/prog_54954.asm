; DESCRIPTION: Composite: Creates a cyan rectangular region at (357, 70) spanning 14 by 73 pixels then Places a white dot at position (244, 199).
; PLAN: r0=357(x), r1=70(y), r2=14(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=244(x), r6=199(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 357
LDI r1, 70
LDI r2, 14
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 199
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
