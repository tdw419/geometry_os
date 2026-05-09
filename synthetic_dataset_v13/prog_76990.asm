; DESCRIPTION: Composite: Places a yellow dot at position (504, 2) then Draws a purple circle centered at (120, 151) with radius 77.
; PLAN: r0=504(x), r1=2(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=120(x), r6=151(y), r7=77(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 504
LDI r1, 2
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 120
LDI r6, 151
LDI r7, 77
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
