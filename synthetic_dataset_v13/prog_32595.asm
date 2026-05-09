; DESCRIPTION: Composite: Draws a cyan circle centered at (152, 117) with radius 79 then Sets a single black pixel at (15, 42).
; PLAN: r0=152(x), r1=117(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=42(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 152
LDI r1, 117
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 42
LDI r7, 0x000000
PSET r5, r6, r7
HALT
