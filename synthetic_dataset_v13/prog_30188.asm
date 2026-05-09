; DESCRIPTION: Places a red circle of radius 51 at center (167, 199).
; PLAN: r0=167(x), r1=199(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 199
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
