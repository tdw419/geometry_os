; DESCRIPTION: Places a cyan circle of radius 14 at center (491, 185).
; PLAN: r0=491(x), r1=185(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 491
LDI r1, 185
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
