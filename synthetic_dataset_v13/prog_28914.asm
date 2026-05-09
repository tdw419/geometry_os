; DESCRIPTION: Composite: Creates a cyan circular shape at (446, 50) with radius 41 then Places a yellow dot at position (476, 17).
; PLAN: r0=446(x), r1=50(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=476(x), r6=17(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 446
LDI r1, 50
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 476
LDI r6, 17
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
