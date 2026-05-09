; DESCRIPTION: Composite: Creates a red rectangular region at (87, 146) spanning 59 by 105 pixels then Sets a single red pixel at (230, 22).
; PLAN: r0=87(x), r1=146(y), r2=59(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x), r6=22(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 87
LDI r1, 146
LDI r2, 59
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 22
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
