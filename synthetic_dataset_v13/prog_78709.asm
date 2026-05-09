; DESCRIPTION: Places a white circle of radius 46 at center (166, 190).
; PLAN: r0=166(x), r1=190(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 190
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
