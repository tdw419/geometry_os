; DESCRIPTION: Renders a cyan disk with center (326, 174) and radius 51.
; PLAN: r0=326(x), r1=174(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 174
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
