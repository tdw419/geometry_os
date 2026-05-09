; DESCRIPTION: Composite: Draws a white circle centered at (417, 127) with radius 33 then Places a yellow dot at position (410, 178).
; PLAN: r0=417(x), r1=127(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=410(x), r6=178(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 417
LDI r1, 127
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 410
LDI r6, 178
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
