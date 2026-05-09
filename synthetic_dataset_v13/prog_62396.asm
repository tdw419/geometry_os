; DESCRIPTION: Composite: Creates a orange rectangular region at (274, 141) spanning 51 by 81 pixels then Sets a single cyan pixel at (330, 39).
; PLAN: r0=274(x), r1=141(y), r2=51(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=330(x), r6=39(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 274
LDI r1, 141
LDI r2, 51
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 39
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
