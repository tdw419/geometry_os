; DESCRIPTION: Composite: Creates a orange rectangular region at (239, 116) spanning 94 by 20 pixels then Places a cyan dot at position (309, 40).
; PLAN: r0=239(x), r1=116(y), r2=94(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x), r6=40(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 239
LDI r1, 116
LDI r2, 94
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 40
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
