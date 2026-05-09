; DESCRIPTION: Places a red circle of radius 15 at center (383, 229).
; PLAN: r0=383(x), r1=229(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 229
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
