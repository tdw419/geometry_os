; DESCRIPTION: Composite: Places a purple dot at position (123, 51) then Renders a white disk with center (259, 213) and radius 31.
; PLAN: r0=123(x), r1=51(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=259(x), r6=213(y), r7=31(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 123
LDI r1, 51
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 259
LDI r6, 213
LDI r7, 31
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
