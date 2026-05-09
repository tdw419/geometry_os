; DESCRIPTION: Composite: Sets a single purple pixel at (302, 24) then Places a white circle of radius 54 at center (66, 108).
; PLAN: r0=302(x), r1=24(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=66(x), r6=108(y), r7=54(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 302
LDI r1, 24
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 66
LDI r6, 108
LDI r7, 54
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
