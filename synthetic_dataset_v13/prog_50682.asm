; DESCRIPTION: Renders a cyan disk with center (172, 56) and radius 24.
; PLAN: r0=172(x), r1=56(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 56
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
