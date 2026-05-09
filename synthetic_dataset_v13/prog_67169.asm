; DESCRIPTION: Composite: Places a yellow dot at position (389, 21) then Renders a purple disk with center (184, 133) and radius 71.
; PLAN: r0=389(x), r1=21(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=184(x), r6=133(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 389
LDI r1, 21
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 184
LDI r6, 133
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
