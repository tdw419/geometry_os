; DESCRIPTION: Places a green circle of radius 77 at center (239, 109).
; PLAN: r0=239(x), r1=109(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 109
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
