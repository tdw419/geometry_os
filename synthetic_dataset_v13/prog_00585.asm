; DESCRIPTION: Composite: Places a magenta dot at position (296, 159) then Creates a orange circular shape at (370, 182) with radius 74.
; PLAN: r0=296(x), r1=159(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=370(x), r6=182(y), r7=74(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 296
LDI r1, 159
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 370
LDI r6, 182
LDI r7, 74
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
