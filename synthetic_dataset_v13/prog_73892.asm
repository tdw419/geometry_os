; DESCRIPTION: Renders a cyan disk with center (326, 51) and radius 24.
; PLAN: r0=326(x), r1=51(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 51
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
