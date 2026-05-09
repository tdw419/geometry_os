; DESCRIPTION: Composite: Places a yellow dot at position (407, 14) then Places a white circle of radius 12 at center (202, 161).
; PLAN: r0=407(x), r1=14(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=161(y), r7=12(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 407
LDI r1, 14
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 202
LDI r6, 161
LDI r7, 12
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
