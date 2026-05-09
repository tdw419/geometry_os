; DESCRIPTION: Renders a cyan disk with center (204, 51) and radius 36.
; PLAN: r0=204(x), r1=51(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 51
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
