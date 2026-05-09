; DESCRIPTION: Composite: Creates a yellow rectangular region at (32, 166) spanning 19 by 15 pixels then Sets a single cyan pixel at (331, 49).
; PLAN: r0=32(x), r1=166(y), r2=19(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=331(x), r6=49(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 32
LDI r1, 166
LDI r2, 19
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 49
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
