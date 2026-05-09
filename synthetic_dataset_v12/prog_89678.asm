; DESCRIPTION: Composite: Sets a single magenta pixel at (443, 27) then Places a yellow circle of radius 33 at center (371, 74).
; PLAN: r0=443(x), r1=27(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=371(x), r6=74(y), r7=33(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 443
LDI r1, 27
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 371
LDI r6, 74
LDI r7, 33
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
