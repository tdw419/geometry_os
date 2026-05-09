; DESCRIPTION: Composite: Sets a single white pixel at (174, 187) then Creates a green circular shape at (256, 101) with radius 79.
; PLAN: r0=174(x), r1=187(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=256(x), r6=101(y), r7=79(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 174
LDI r1, 187
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 256
LDI r6, 101
LDI r7, 79
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
