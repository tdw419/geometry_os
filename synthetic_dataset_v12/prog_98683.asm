; DESCRIPTION: Places a red circle of radius 32 at center (424, 112).
; PLAN: r0=424(x), r1=112(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 112
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
