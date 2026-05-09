; DESCRIPTION: Composite: Renders a red disk with center (96, 128) and radius 78 then Sets a single black pixel at (204, 113).
; PLAN: r0=96(x), r1=128(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=204(x), r6=113(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 96
LDI r1, 128
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 204
LDI r6, 113
LDI r7, 0x000000
PSET r5, r6, r7
HALT
