; DESCRIPTION: Draws a cyan circle centered at (322, 155) with radius 26.
; PLAN: r0=322(x), r1=155(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 155
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
