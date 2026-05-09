; DESCRIPTION: Renders a cyan disk with center (322, 90) and radius 53.
; PLAN: r0=322(x), r1=90(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 90
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
