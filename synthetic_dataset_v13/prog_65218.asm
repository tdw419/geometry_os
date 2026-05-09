; DESCRIPTION: Composite: Places a purple dot at position (369, 162) then Draws a black circle centered at (175, 145) with radius 55.
; PLAN: r0=369(x), r1=162(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=175(x), r6=145(y), r7=55(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 369
LDI r1, 162
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 175
LDI r6, 145
LDI r7, 55
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
