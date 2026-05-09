; DESCRIPTION: Composite: Renders a black box of size 59x23 starting at (178, 117) then Sets a single green pixel at (478, 90).
; PLAN: r0=178(x), r1=117(y), r2=59(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=478(x), r6=90(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 178
LDI r1, 117
LDI r2, 59
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 90
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
