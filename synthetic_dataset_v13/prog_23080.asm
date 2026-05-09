; DESCRIPTION: Places a red circle of radius 76 at center (90, 105).
; PLAN: r0=90(x), r1=105(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 105
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
