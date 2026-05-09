; DESCRIPTION: Renders a cyan disk with center (438, 155) and radius 26.
; PLAN: r0=438(x), r1=155(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 155
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
