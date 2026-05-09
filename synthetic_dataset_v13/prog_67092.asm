; DESCRIPTION: Places a white circle of radius 24 at center (127, 171).
; PLAN: r0=127(x), r1=171(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 171
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
