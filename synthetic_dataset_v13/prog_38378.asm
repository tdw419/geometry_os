; DESCRIPTION: Renders a cyan disk with center (354, 185) and radius 66.
; PLAN: r0=354(x), r1=185(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 185
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
