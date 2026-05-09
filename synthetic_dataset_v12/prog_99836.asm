; DESCRIPTION: Places a white circle of radius 33 at center (237, 207).
; PLAN: r0=237(x), r1=207(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 207
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
