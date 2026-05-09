; DESCRIPTION: Composite: Creates a cyan rectangular region at (164, 85) spanning 62 by 63 pixels then Places a white dot at position (12, 80).
; PLAN: r0=164(x), r1=85(y), r2=62(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=12(x), r6=80(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 164
LDI r1, 85
LDI r2, 62
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 80
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
