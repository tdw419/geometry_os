; DESCRIPTION: Composite: Places a black dot at position (49, 17) then Places a black 105x79 rectangle at position (245, 67).
; PLAN: r0=49(x), r1=17(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=245(x), r6=67(y), r7=105(width), r8=79(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 49
LDI r1, 17
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 245
LDI r6, 67
LDI r7, 105
LDI r8, 79
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
