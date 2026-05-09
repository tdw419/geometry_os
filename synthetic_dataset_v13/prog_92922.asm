; DESCRIPTION: Renders a red disk with center (237, 111) and radius 18.
; PLAN: r0=237(x), r1=111(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 111
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
