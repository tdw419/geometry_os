; DESCRIPTION: Places a red circle of radius 57 at center (393, 191).
; PLAN: r0=393(x), r1=191(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 191
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
