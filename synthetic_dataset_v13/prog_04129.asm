; DESCRIPTION: Places a purple circle of radius 74 at center (365, 107).
; PLAN: r0=365(x), r1=107(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 107
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
