; DESCRIPTION: Renders a cyan disk with center (337, 163) and radius 73.
; PLAN: r0=337(x), r1=163(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 163
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
