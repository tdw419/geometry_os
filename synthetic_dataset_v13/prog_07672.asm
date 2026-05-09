; DESCRIPTION: Places a red circle of radius 73 at center (76, 135).
; PLAN: r0=76(x), r1=135(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 135
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
