; DESCRIPTION: Places a green circle of radius 29 at center (331, 125).
; PLAN: r0=331(x), r1=125(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 125
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
