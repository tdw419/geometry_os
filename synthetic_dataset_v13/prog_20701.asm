; DESCRIPTION: Renders a cyan disk with center (354, 204) and radius 26.
; PLAN: r0=354(x), r1=204(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 204
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
