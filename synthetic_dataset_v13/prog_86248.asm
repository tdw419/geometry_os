; DESCRIPTION: Composite: Creates a cyan rectangular region at (243, 241) spanning 27 by 15 pixels then Sets a single yellow pixel at (366, 207).
; PLAN: r0=243(x), r1=241(y), r2=27(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=366(x), r6=207(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 243
LDI r1, 241
LDI r2, 27
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 207
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
