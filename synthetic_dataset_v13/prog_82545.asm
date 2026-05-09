; DESCRIPTION: Composite: Creates a cyan rectangular region at (167, 67) spanning 57 by 31 pixels then Places a white dot at position (464, 140).
; PLAN: r0=167(x), r1=67(y), r2=57(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=464(x), r6=140(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 167
LDI r1, 67
LDI r2, 57
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 140
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
