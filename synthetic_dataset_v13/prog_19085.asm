; DESCRIPTION: Composite: Places a white dot at position (43, 43) then Places a green circle of radius 75 at center (349, 77).
; PLAN: r0=43(x), r1=43(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=349(x), r6=77(y), r7=75(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 43
LDI r1, 43
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 349
LDI r6, 77
LDI r7, 75
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
