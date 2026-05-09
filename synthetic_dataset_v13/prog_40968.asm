; DESCRIPTION: Composite: Places a cyan dot at position (287, 160) then Places a purple circle of radius 34 at center (276, 73).
; PLAN: r0=287(x), r1=160(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=276(x), r6=73(y), r7=34(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 287
LDI r1, 160
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 276
LDI r6, 73
LDI r7, 34
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
