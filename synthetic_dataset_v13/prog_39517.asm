; DESCRIPTION: Composite: Creates a black rectangular region at (385, 68) spanning 61 by 108 pixels then Places a magenta dot at position (70, 89).
; PLAN: r0=385(x), r1=68(y), r2=61(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=70(x), r6=89(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 385
LDI r1, 68
LDI r2, 61
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 89
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
