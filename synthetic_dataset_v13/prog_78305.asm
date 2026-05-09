; DESCRIPTION: Composite: Draws a purple circle centered at (227, 135) with radius 32 then Places a cyan dot at position (340, 34).
; PLAN: r0=227(x), r1=135(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=340(x), r6=34(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 227
LDI r1, 135
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 340
LDI r6, 34
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
