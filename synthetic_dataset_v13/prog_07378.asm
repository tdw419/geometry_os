; DESCRIPTION: Renders a cyan disk with center (322, 171) and radius 76.
; PLAN: r0=322(x), r1=171(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 171
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
