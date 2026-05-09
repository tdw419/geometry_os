; DESCRIPTION: Places a white circle of radius 77 at center (239, 152).
; PLAN: r0=239(x), r1=152(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 152
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
