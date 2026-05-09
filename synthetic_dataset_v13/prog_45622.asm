; DESCRIPTION: Composite: Draws a yellow circle centered at (170, 145) with radius 59 then Places a red dot at position (201, 57).
; PLAN: r0=170(x), r1=145(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x), r6=57(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 170
LDI r1, 145
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 57
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
