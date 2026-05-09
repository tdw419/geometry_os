; DESCRIPTION: Composite: Places a red dot at position (365, 3) then Places a magenta circle of radius 70 at center (296, 72).
; PLAN: r0=365(x), r1=3(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=296(x), r6=72(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 365
LDI r1, 3
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 296
LDI r6, 72
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
