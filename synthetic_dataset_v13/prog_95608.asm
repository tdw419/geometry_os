; DESCRIPTION: Composite: Renders a black box of size 51x73 starting at (10, 70) then Sets a single black pixel at (155, 135).
; PLAN: r0=10(x), r1=70(y), r2=51(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=155(x), r6=135(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 10
LDI r1, 70
LDI r2, 51
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 135
LDI r7, 0x000000
PSET r5, r6, r7
HALT
