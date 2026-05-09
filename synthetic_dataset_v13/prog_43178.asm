; DESCRIPTION: Places a white circle of radius 26 at center (46, 138).
; PLAN: r0=46(x), r1=138(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 138
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
