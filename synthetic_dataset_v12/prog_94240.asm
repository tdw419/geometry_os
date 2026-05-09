; DESCRIPTION: Places a blue circle of radius 13 at center (96, 235).
; PLAN: r0=96(x), r1=235(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 235
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
