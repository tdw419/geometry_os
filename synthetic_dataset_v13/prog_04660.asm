; DESCRIPTION: Places a red circle of radius 25 at center (458, 133).
; PLAN: r0=458(x), r1=133(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 133
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
