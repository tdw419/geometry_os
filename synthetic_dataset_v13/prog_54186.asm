; DESCRIPTION: Composite: Creates a green rectangular region at (207, 108) spanning 37 by 19 pixels then Sets a single green pixel at (148, 195).
; PLAN: r0=207(x), r1=108(y), r2=37(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=148(x), r6=195(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 207
LDI r1, 108
LDI r2, 37
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 195
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
