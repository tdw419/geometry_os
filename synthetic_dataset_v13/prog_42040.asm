; DESCRIPTION: Places a blue circle of radius 57 at center (82, 171).
; PLAN: r0=82(x), r1=171(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 171
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
