; DESCRIPTION: Composite: Places a red 69x118 rectangle at position (368, 37) then Sets a single black pixel at (249, 250).
; PLAN: r0=368(x), r1=37(y), r2=69(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=249(x), r6=250(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 368
LDI r1, 37
LDI r2, 69
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 250
LDI r7, 0x000000
PSET r5, r6, r7
HALT
