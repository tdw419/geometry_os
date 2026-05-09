; DESCRIPTION: Composite: Creates a white rectangular region at (421, 67) spanning 45 by 83 pixels then Places a magenta dot at position (479, 44).
; PLAN: r0=421(x), r1=67(y), r2=45(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=479(x), r6=44(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 421
LDI r1, 67
LDI r2, 45
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 479
LDI r6, 44
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
