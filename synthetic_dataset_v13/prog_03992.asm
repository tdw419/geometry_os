; DESCRIPTION: Renders a cyan disk with center (418, 52) and radius 51.
; PLAN: r0=418(x), r1=52(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 52
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
