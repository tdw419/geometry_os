; DESCRIPTION: Places a red circle of radius 10 at center (389, 158).
; PLAN: r0=389(x), r1=158(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 158
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
