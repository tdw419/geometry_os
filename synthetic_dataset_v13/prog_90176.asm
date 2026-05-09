; DESCRIPTION: Composite: Places a red dot at position (318, 29) then Renders a yellow disk with center (181, 127) and radius 41.
; PLAN: r0=318(x), r1=29(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=181(x), r6=127(y), r7=41(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 318
LDI r1, 29
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 181
LDI r6, 127
LDI r7, 41
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
