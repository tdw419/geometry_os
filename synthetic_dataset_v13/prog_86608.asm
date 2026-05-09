; DESCRIPTION: Composite: Places a yellow dot at position (367, 174) then Draws a purple circle centered at (345, 174) with radius 32.
; PLAN: r0=367(x), r1=174(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=345(x), r6=174(y), r7=32(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 367
LDI r1, 174
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 345
LDI r6, 174
LDI r7, 32
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
