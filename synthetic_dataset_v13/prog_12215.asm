; DESCRIPTION: Composite: Places a white circle of radius 73 at center (103, 164) then Places a purple dot at position (405, 74).
; PLAN: r0=103(x), r1=164(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=405(x), r6=74(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 103
LDI r1, 164
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 405
LDI r6, 74
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
