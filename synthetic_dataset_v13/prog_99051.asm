; DESCRIPTION: Composite: Creates a white circular shape at (293, 97) with radius 54 then Sets a single cyan pixel at (187, 12).
; PLAN: r0=293(x), r1=97(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=187(x), r6=12(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 293
LDI r1, 97
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 187
LDI r6, 12
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
