; DESCRIPTION: Composite: Places a white circle of radius 16 at center (399, 51) then Places a green dot at position (468, 167).
; PLAN: r0=399(x), r1=51(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=468(x), r6=167(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 399
LDI r1, 51
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 468
LDI r6, 167
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
