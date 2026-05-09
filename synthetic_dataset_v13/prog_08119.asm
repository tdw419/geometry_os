; DESCRIPTION: Places a white circle of radius 65 at center (140, 171).
; PLAN: r0=140(x), r1=171(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 171
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
