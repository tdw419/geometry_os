; DESCRIPTION: Places a white circle of radius 25 at center (46, 226).
; PLAN: r0=46(x), r1=226(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 226
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
