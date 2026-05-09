; DESCRIPTION: Composite: Renders a black box of size 92x119 starting at (355, 51) then Sets a single cyan pixel at (487, 69).
; PLAN: r0=355(x), r1=51(y), r2=92(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=487(x), r6=69(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 355
LDI r1, 51
LDI r2, 92
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 69
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
