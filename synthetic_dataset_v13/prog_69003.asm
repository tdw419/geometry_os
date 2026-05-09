; DESCRIPTION: Composite: Places a purple dot at position (218, 185) then Draws a red circle centered at (153, 96) with radius 66.
; PLAN: r0=218(x), r1=185(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=153(x), r6=96(y), r7=66(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 218
LDI r1, 185
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 153
LDI r6, 96
LDI r7, 66
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
