; DESCRIPTION: Composite: Creates a orange rectangular region at (239, 37) spanning 70 by 120 pixels then Places a cyan dot at position (144, 199).
; PLAN: r0=239(x), r1=37(y), r2=70(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=144(x), r6=199(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 239
LDI r1, 37
LDI r2, 70
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 199
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
