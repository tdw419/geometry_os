; DESCRIPTION: Composite: Creates a cyan rectangular region at (420, 220) spanning 62 by 16 pixels then Sets a single black pixel at (83, 212).
; PLAN: r0=420(x), r1=220(y), r2=62(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=83(x), r6=212(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 420
LDI r1, 220
LDI r2, 62
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 212
LDI r7, 0x000000
PSET r5, r6, r7
HALT
