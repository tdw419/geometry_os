; DESCRIPTION: Composite: Renders a red disk with center (220, 106) and radius 77 then Places a red dot at position (125, 12).
; PLAN: r0=220(x), r1=106(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=125(x), r6=12(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 220
LDI r1, 106
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 125
LDI r6, 12
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
