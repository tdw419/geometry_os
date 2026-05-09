; DESCRIPTION: Places a cyan circle of radius 13 at center (293, 51).
; PLAN: r0=293(x), r1=51(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 51
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
