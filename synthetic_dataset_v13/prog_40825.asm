; DESCRIPTION: Places a cyan circle of radius 35 at center (396, 212).
; PLAN: r0=396(x), r1=212(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 212
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
