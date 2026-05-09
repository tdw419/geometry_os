; DESCRIPTION: Places a white circle of radius 11 at center (132, 209).
; PLAN: r0=132(x), r1=209(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 209
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
