; DESCRIPTION: Composite: Places a cyan circle of radius 78 at center (183, 142) then Places a red dot at position (499, 26).
; PLAN: r0=183(x), r1=142(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=499(x), r6=26(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 183
LDI r1, 142
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 499
LDI r6, 26
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
