; DESCRIPTION: Composite: Places a magenta dot at position (431, 182) then Draws a white circle centered at (300, 99) with radius 44.
; PLAN: r0=431(x), r1=182(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=99(y), r7=44(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 431
LDI r1, 182
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 300
LDI r6, 99
LDI r7, 44
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
