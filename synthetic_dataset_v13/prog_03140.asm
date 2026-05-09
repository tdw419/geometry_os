; DESCRIPTION: Places a white circle of radius 39 at center (73, 177).
; PLAN: r0=73(x), r1=177(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 177
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
