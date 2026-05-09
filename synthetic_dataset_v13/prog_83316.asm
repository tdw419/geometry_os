; DESCRIPTION: Places a blue circle of radius 72 at center (235, 103).
; PLAN: r0=235(x), r1=103(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 103
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
