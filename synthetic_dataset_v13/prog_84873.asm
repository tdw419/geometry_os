; DESCRIPTION: Composite: Creates a green rectangular region at (262, 29) spanning 25 by 58 pixels then Sets a single green pixel at (2, 249).
; PLAN: r0=262(x), r1=29(y), r2=25(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=2(x), r6=249(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 262
LDI r1, 29
LDI r2, 25
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 249
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
