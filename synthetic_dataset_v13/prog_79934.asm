; DESCRIPTION: Composite: Creates a yellow rectangular region at (350, 37) spanning 28 by 101 pixels then Places a black dot at position (352, 92).
; PLAN: r0=350(x), r1=37(y), r2=28(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=352(x), r6=92(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 350
LDI r1, 37
LDI r2, 28
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 92
LDI r7, 0x000000
PSET r5, r6, r7
HALT
