; DESCRIPTION: Composite: Creates a orange rectangular region at (339, 37) spanning 105 by 21 pixels then Places a red dot at position (16, 14).
; PLAN: r0=339(x), r1=37(y), r2=105(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x), r6=14(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 339
LDI r1, 37
LDI r2, 105
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 14
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
