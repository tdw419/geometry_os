; DESCRIPTION: Places a red circle of radius 46 at center (89, 165).
; PLAN: r0=89(x), r1=165(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 165
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
