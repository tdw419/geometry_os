; DESCRIPTION: Composite: Creates a white circular shape at (35, 200) with radius 12 then Places a cyan dot at position (226, 255).
; PLAN: r0=35(x), r1=200(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x), r6=255(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 35
LDI r1, 200
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 255
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
