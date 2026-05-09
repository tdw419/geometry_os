; DESCRIPTION: Composite: Sets a single red pixel at (279, 59) then Draws a yellow circle centered at (105, 46) with radius 28.
; PLAN: r0=279(x), r1=59(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=105(x), r6=46(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 279
LDI r1, 59
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 105
LDI r6, 46
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
