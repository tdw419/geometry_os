; DESCRIPTION: Composite: Renders a red disk with center (415, 76) and radius 35 then Places a red dot at position (21, 138).
; PLAN: r0=415(x), r1=76(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=21(x), r6=138(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 415
LDI r1, 76
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 21
LDI r6, 138
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
