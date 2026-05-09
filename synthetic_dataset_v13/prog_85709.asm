; DESCRIPTION: Places a white circle of radius 28 at center (302, 83).
; PLAN: r0=302(x), r1=83(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 83
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
