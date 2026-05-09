; DESCRIPTION: Renders a cyan disk with center (107, 71) and radius 19.
; PLAN: r0=107(x), r1=71(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 71
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
