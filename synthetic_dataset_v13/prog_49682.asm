; DESCRIPTION: Composite: Renders a black box of size 96x31 starting at (185, 76) then Sets a single white pixel at (254, 105).
; PLAN: r0=185(x), r1=76(y), r2=96(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=254(x), r6=105(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 185
LDI r1, 76
LDI r2, 96
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 105
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
