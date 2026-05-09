; DESCRIPTION: Renders a cyan disk with center (289, 202) and radius 51.
; PLAN: r0=289(x), r1=202(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 202
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
