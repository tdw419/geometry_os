; DESCRIPTION: Composite: Places a blue circle of radius 57 at center (373, 81) then Places a cyan dot at position (115, 187).
; PLAN: r0=373(x), r1=81(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x), r6=187(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 373
LDI r1, 81
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 187
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
