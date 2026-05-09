; DESCRIPTION: Composite: Places a magenta dot at position (99, 35) then Creates a yellow circular shape at (217, 162) with radius 72.
; PLAN: r0=99(x), r1=35(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=162(y), r7=72(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 99
LDI r1, 35
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 217
LDI r6, 162
LDI r7, 72
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
