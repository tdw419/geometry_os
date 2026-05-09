; DESCRIPTION: Composite: Creates a magenta rectangular region at (87, 205) spanning 114 by 37 pixels then Places a black dot at position (59, 32).
; PLAN: r0=87(x), r1=205(y), r2=114(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=59(x), r6=32(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 87
LDI r1, 205
LDI r2, 114
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 32
LDI r7, 0x000000
PSET r5, r6, r7
HALT
