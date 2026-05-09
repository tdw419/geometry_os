; DESCRIPTION: Places a cyan circle of radius 35 at center (257, 80).
; PLAN: r0=257(x), r1=80(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 80
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
