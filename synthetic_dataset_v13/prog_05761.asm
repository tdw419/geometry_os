; DESCRIPTION: Places a red circle of radius 64 at center (221, 64).
; PLAN: r0=221(x), r1=64(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 64
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
