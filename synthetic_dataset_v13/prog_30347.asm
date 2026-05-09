; DESCRIPTION: Composite: Sets a single purple pixel at (60, 131) then Places a white circle of radius 70 at center (377, 134).
; PLAN: r0=60(x), r1=131(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=377(x), r6=134(y), r7=70(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 60
LDI r1, 131
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 377
LDI r6, 134
LDI r7, 70
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
