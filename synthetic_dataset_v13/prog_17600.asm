; DESCRIPTION: Places a red circle of radius 38 at center (299, 51).
; PLAN: r0=299(x), r1=51(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 51
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
