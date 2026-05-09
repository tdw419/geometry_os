; DESCRIPTION: Places a red circle of radius 31 at center (293, 220).
; PLAN: r0=293(x), r1=220(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 220
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
