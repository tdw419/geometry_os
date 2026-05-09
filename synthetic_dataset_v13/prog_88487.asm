; DESCRIPTION: Composite: Places a white dot at position (444, 86) then Places a red circle of radius 32 at center (322, 196).
; PLAN: r0=444(x), r1=86(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=322(x), r6=196(y), r7=32(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 444
LDI r1, 86
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 322
LDI r6, 196
LDI r7, 32
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
