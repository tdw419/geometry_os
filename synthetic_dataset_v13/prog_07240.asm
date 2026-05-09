; DESCRIPTION: Places a cyan circle of radius 26 at center (322, 107).
; PLAN: r0=322(x), r1=107(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 107
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
