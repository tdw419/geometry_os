; DESCRIPTION: Composite: Sets a single magenta pixel at (473, 168) then Places a blue circle of radius 61 at center (261, 132).
; PLAN: r0=473(x), r1=168(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=261(x), r6=132(y), r7=61(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 473
LDI r1, 168
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 261
LDI r6, 132
LDI r7, 61
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
