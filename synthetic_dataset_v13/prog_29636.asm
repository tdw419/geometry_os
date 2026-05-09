; DESCRIPTION: Composite: Places a red 51x118 rectangle at position (362, 118) then Sets a single black pixel at (118, 59).
; PLAN: r0=362(x), r1=118(y), r2=51(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x), r6=59(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 362
LDI r1, 118
LDI r2, 51
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 59
LDI r7, 0x000000
PSET r5, r6, r7
HALT
