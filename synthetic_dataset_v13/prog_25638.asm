; DESCRIPTION: Places a white circle of radius 33 at center (255, 216).
; PLAN: r0=255(x), r1=216(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 216
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
