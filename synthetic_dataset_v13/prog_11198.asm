; DESCRIPTION: Renders a green disk with center (405, 159) and radius 51.
; PLAN: r0=405(x), r1=159(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 159
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
