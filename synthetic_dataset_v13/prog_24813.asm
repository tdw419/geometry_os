; DESCRIPTION: Composite: Creates a black rectangular region at (149, 152) spanning 107 by 18 pixels then Places a cyan dot at position (59, 9).
; PLAN: r0=149(x), r1=152(y), r2=107(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=59(x), r6=9(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 149
LDI r1, 152
LDI r2, 107
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 9
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
