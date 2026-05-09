; DESCRIPTION: Places a white circle of radius 72 at center (394, 107).
; PLAN: r0=394(x), r1=107(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 107
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
