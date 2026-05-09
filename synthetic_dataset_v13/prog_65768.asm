; DESCRIPTION: Composite: Renders a black box of size 37x69 starting at (469, 14) then Places a orange dot at position (468, 72).
; PLAN: r0=469(x), r1=14(y), r2=37(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x), r6=72(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 469
LDI r1, 14
LDI r2, 37
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 72
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
