; DESCRIPTION: Composite: Creates a white circular shape at (372, 216) with radius 29 then Places a cyan dot at position (222, 33).
; PLAN: r0=372(x), r1=216(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=222(x), r6=33(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 372
LDI r1, 216
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 222
LDI r6, 33
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
