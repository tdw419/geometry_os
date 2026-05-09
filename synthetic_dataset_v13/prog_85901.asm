; DESCRIPTION: Renders a cyan disk with center (132, 132) and radius 33.
; PLAN: r0=132(x), r1=132(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 132
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
