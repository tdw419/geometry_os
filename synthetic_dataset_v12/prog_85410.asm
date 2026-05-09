; DESCRIPTION: Places a white circle of radius 49 at center (154, 171).
; PLAN: r0=154(x), r1=171(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 171
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
