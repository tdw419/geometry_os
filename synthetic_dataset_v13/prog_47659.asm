; DESCRIPTION: Composite: Places a magenta circle of radius 41 at center (411, 129) then Sets a single white pixel at (60, 84).
; PLAN: r0=411(x), r1=129(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=60(x), r6=84(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 411
LDI r1, 129
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 60
LDI r6, 84
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
