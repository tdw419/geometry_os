; DESCRIPTION: Renders a cyan disk with center (471, 137) and radius 21.
; PLAN: r0=471(x), r1=137(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 137
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
