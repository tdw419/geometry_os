; DESCRIPTION: Places a red circle of radius 33 at center (88, 82).
; PLAN: r0=88(x), r1=82(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 82
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
