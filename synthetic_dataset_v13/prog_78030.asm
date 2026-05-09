; DESCRIPTION: Composite: Renders a blue box of size 29x117 starting at (391, 45) then Sets a single white pixel at (458, 58).
; PLAN: r0=391(x), r1=45(y), r2=29(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=458(x), r6=58(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 391
LDI r1, 45
LDI r2, 29
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 58
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
