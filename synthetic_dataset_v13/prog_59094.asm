; DESCRIPTION: Places a red circle of radius 73 at center (419, 127).
; PLAN: r0=419(x), r1=127(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 127
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
