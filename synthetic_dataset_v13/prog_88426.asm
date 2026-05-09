; DESCRIPTION: Places a purple circle of radius 30 at center (267, 171).
; PLAN: r0=267(x), r1=171(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 171
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
