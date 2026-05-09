; DESCRIPTION: Renders a red disk with center (261, 51) and radius 42.
; PLAN: r0=261(x), r1=51(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 51
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
