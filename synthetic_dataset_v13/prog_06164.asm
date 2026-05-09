; DESCRIPTION: Places a red circle of radius 12 at center (322, 79).
; PLAN: r0=322(x), r1=79(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 79
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
