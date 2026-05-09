; DESCRIPTION: Composite: Renders a magenta disk with center (426, 97) and radius 41 then Places a red dot at position (366, 29).
; PLAN: r0=426(x), r1=97(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=366(x), r6=29(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 426
LDI r1, 97
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 366
LDI r6, 29
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
