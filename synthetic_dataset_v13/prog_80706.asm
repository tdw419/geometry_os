; DESCRIPTION: Composite: Places a red dot at position (444, 32) then Renders a yellow disk with center (419, 106) and radius 41.
; PLAN: r0=444(x), r1=32(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=419(x), r6=106(y), r7=41(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 444
LDI r1, 32
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 419
LDI r6, 106
LDI r7, 41
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
