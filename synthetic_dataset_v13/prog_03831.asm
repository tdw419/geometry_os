; DESCRIPTION: Renders a cyan disk with center (405, 51) and radius 17.
; PLAN: r0=405(x), r1=51(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 51
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
