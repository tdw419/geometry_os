; DESCRIPTION: Composite: Places a red dot at position (414, 5) then Places a cyan circle of radius 74 at center (234, 101).
; PLAN: r0=414(x), r1=5(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=234(x), r6=101(y), r7=74(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 414
LDI r1, 5
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 234
LDI r6, 101
LDI r7, 74
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
