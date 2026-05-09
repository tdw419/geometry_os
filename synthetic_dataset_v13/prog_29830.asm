; DESCRIPTION: Composite: Places a cyan dot at position (499, 212) then Places a red circle of radius 29 at center (183, 34).
; PLAN: r0=499(x), r1=212(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=34(y), r7=29(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 499
LDI r1, 212
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 183
LDI r6, 34
LDI r7, 29
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
