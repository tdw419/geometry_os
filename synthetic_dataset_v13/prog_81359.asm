; DESCRIPTION: Places a white circle of radius 67 at center (235, 107).
; PLAN: r0=235(x), r1=107(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 107
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
