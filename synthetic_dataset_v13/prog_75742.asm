; DESCRIPTION: Renders a cyan disk with center (286, 81) and radius 79.
; PLAN: r0=286(x), r1=81(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 81
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
