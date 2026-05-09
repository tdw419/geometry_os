; DESCRIPTION: Places a white circle of radius 46 at center (239, 207).
; PLAN: r0=239(x), r1=207(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 207
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
