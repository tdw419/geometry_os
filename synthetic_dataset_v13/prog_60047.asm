; DESCRIPTION: Places a red circle of radius 36 at center (92, 181).
; PLAN: r0=92(x), r1=181(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 181
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
