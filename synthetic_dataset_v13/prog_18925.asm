; DESCRIPTION: Composite: Places a cyan dot at position (105, 48) then Places a black circle of radius 34 at center (420, 185).
; PLAN: r0=105(x), r1=48(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=420(x), r6=185(y), r7=34(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 105
LDI r1, 48
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 420
LDI r6, 185
LDI r7, 34
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
