; DESCRIPTION: Renders a cyan disk with center (208, 86) and radius 66.
; PLAN: r0=208(x), r1=86(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 86
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
