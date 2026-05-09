; DESCRIPTION: Composite: Places a red dot at position (299, 151) then Renders a orange disk with center (317, 90) and radius 43.
; PLAN: r0=299(x), r1=151(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=317(x), r6=90(y), r7=43(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 299
LDI r1, 151
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 317
LDI r6, 90
LDI r7, 43
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
