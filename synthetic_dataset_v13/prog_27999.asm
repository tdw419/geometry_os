; DESCRIPTION: Composite: Creates a yellow rectangular region at (105, 22) spanning 34 by 114 pixels then Sets a single cyan pixel at (473, 82).
; PLAN: r0=105(x), r1=22(y), r2=34(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=473(x), r6=82(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 105
LDI r1, 22
LDI r2, 34
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 473
LDI r6, 82
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
