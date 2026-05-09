; DESCRIPTION: Places a white circle of radius 50 at center (417, 51).
; PLAN: r0=417(x), r1=51(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 51
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
