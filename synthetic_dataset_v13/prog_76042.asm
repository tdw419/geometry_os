; DESCRIPTION: Renders a cyan disk with center (226, 157) and radius 63.
; PLAN: r0=226(x), r1=157(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 157
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
