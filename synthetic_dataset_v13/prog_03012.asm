; DESCRIPTION: Composite: Places a purple dot at position (292, 2) then Creates a magenta circular shape at (90, 146) with radius 70.
; PLAN: r0=292(x), r1=2(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=90(x), r6=146(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 292
LDI r1, 2
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 90
LDI r6, 146
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
