; DESCRIPTION: Places a white circle of radius 77 at center (347, 150).
; PLAN: r0=347(x), r1=150(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 150
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
