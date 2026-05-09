; DESCRIPTION: Composite: Creates a black rectangular region at (380, 99) spanning 37 by 105 pixels then Places a yellow dot at position (161, 141).
; PLAN: r0=380(x), r1=99(y), r2=37(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=161(x), r6=141(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 380
LDI r1, 99
LDI r2, 37
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 141
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
