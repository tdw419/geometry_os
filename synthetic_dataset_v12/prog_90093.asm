; DESCRIPTION: Composite: Places a red dot at position (82, 22) then Draws a orange circle centered at (164, 174) with radius 73.
; PLAN: r0=82(x), r1=22(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=164(x), r6=174(y), r7=73(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 82
LDI r1, 22
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 164
LDI r6, 174
LDI r7, 73
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
