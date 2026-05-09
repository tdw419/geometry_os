; DESCRIPTION: Composite: Places a red dot at position (60, 33) then Places a magenta circle of radius 55 at center (251, 165).
; PLAN: r0=60(x), r1=33(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=251(x), r6=165(y), r7=55(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 60
LDI r1, 33
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 251
LDI r6, 165
LDI r7, 55
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
