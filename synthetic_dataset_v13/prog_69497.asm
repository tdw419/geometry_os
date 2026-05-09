; DESCRIPTION: Places a white circle of radius 46 at center (306, 89).
; PLAN: r0=306(x), r1=89(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 89
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
