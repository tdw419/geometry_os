; DESCRIPTION: Places a red circle of radius 32 at center (247, 77).
; PLAN: r0=247(x), r1=77(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 77
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
