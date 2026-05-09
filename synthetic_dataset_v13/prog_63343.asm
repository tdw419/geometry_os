; DESCRIPTION: Composite: Creates a orange rectangular region at (25, 88) spanning 68 by 20 pixels then Places a cyan dot at position (436, 139).
; PLAN: r0=25(x), r1=88(y), r2=68(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x), r6=139(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 25
LDI r1, 88
LDI r2, 68
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 139
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
