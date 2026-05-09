; DESCRIPTION: Composite: Draws a yellow circle centered at (308, 228) with radius 19 then Places a purple dot at position (29, 31).
; PLAN: r0=308(x), r1=228(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x), r6=31(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 308
LDI r1, 228
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 31
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
