; DESCRIPTION: Places a white circle of radius 46 at center (187, 75).
; PLAN: r0=187(x), r1=75(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 75
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
