; DESCRIPTION: Composite: Sets a single magenta pixel at (104, 161) then Renders a purple disk with center (252, 164) and radius 64.
; PLAN: r0=104(x), r1=161(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=252(x), r6=164(y), r7=64(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 104
LDI r1, 161
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 252
LDI r6, 164
LDI r7, 64
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
