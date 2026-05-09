; DESCRIPTION: Composite: Places a magenta dot at position (305, 76) then Draws a white circle centered at (68, 201) with radius 55.
; PLAN: r0=305(x), r1=76(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=68(x), r6=201(y), r7=55(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 305
LDI r1, 76
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 68
LDI r6, 201
LDI r7, 55
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
