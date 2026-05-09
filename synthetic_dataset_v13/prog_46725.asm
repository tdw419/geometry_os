; DESCRIPTION: Places a white circle of radius 29 at center (135, 124).
; PLAN: r0=135(x), r1=124(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 124
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
