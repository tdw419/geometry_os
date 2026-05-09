; DESCRIPTION: Places a black circle of radius 47 at center (305, 125).
; PLAN: r0=305(x), r1=125(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 125
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
