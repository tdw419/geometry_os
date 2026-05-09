; DESCRIPTION: Composite: Places a blue circle of radius 47 at center (92, 116) then Places a cyan dot at position (329, 49).
; PLAN: r0=92(x), r1=116(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x), r6=49(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 92
LDI r1, 116
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 49
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
