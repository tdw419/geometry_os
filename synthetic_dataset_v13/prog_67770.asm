; DESCRIPTION: Places a red circle of radius 46 at center (217, 118).
; PLAN: r0=217(x), r1=118(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 118
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
