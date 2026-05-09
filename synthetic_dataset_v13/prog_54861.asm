; DESCRIPTION: Renders a cyan disk with center (351, 107) and radius 72.
; PLAN: r0=351(x), r1=107(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 107
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
