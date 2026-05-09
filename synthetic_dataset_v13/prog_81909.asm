; DESCRIPTION: Composite: Places a white dot at position (420, 204) then Places a magenta circle of radius 33 at center (389, 74).
; PLAN: r0=420(x), r1=204(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=389(x), r6=74(y), r7=33(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 420
LDI r1, 204
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 389
LDI r6, 74
LDI r7, 33
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
