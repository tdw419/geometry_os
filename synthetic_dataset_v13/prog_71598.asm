; DESCRIPTION: Composite: Renders a yellow box of size 17x45 starting at (418, 52) then Places a purple dot at position (511, 92).
; PLAN: r0=418(x), r1=52(y), r2=17(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=511(x), r6=92(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 418
LDI r1, 52
LDI r2, 17
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 92
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
