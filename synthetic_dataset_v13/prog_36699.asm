; DESCRIPTION: Composite: Draws a white circle centered at (367, 65) with radius 59 then Places a yellow dot at position (467, 0).
; PLAN: r0=367(x), r1=65(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=467(x), r6=0(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 367
LDI r1, 65
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 467
LDI r6, 0
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
