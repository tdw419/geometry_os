; DESCRIPTION: Composite: Places a white circle of radius 59 at center (285, 74) then Places a black dot at position (303, 119).
; PLAN: r0=285(x), r1=74(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=303(x), r6=119(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 285
LDI r1, 74
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 303
LDI r6, 119
LDI r7, 0x000000
PSET r5, r6, r7
HALT
