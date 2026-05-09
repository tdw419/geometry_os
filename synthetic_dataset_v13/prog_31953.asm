; DESCRIPTION: Composite: Places a black circle of radius 50 at center (372, 133) then Sets a single cyan pixel at (322, 41).
; PLAN: r0=372(x), r1=133(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x), r6=41(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 372
LDI r1, 133
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 41
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
