; DESCRIPTION: Composite: Creates a purple rectangular region at (158, 75) spanning 51 by 70 pixels then Places a black dot at position (510, 170).
; PLAN: r0=158(x), r1=75(y), r2=51(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=510(x), r6=170(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 158
LDI r1, 75
LDI r2, 51
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 510
LDI r6, 170
LDI r7, 0x000000
PSET r5, r6, r7
HALT
