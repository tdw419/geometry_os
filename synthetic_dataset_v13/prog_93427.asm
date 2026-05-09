; DESCRIPTION: Places a green circle of radius 56 at center (90, 171).
; PLAN: r0=90(x), r1=171(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 171
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
