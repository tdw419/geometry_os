; DESCRIPTION: Composite: Places a yellow circle of radius 78 at center (100, 112) then Places a blue dot at position (349, 171).
; PLAN: r0=100(x), r1=112(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x), r6=171(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 100
LDI r1, 112
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 171
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
