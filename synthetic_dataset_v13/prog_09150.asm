; DESCRIPTION: Composite: Sets a single red pixel at (442, 202) then Renders a purple disk with center (113, 103) and radius 79.
; PLAN: r0=442(x), r1=202(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=113(x), r6=103(y), r7=79(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 442
LDI r1, 202
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 113
LDI r6, 103
LDI r7, 79
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
