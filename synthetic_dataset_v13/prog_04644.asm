; DESCRIPTION: Places a cyan circle of radius 19 at center (402, 162).
; PLAN: r0=402(x), r1=162(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 162
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
