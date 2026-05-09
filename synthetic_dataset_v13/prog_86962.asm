; DESCRIPTION: Places a white circle of radius 46 at center (105, 205).
; PLAN: r0=105(x), r1=205(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 205
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
